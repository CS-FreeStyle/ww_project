#include "myav.h"

#include <nppi.h>
#include <cuda_runtime_api.h>

#include <unistd.h>
#include <fcntl.h>

// Allocate GPU buffers to hold yuv420p frame data for the encoder. The 
// allocated buffers can be retrieved from the codec context's 
// hw_frames_ref member. Acquiring the buffer is done via  
// av_hwframe_get_buffer.
int set_hwframe_ctx(AVCodecContext *codec_context, AVBufferRef *hw_device_ctx){

  AVBufferRef *hw_frames_ref = NULL;
  AVHWFramesContext *frames_ctx = NULL;

  hw_frames_ref = av_hwframe_ctx_alloc(hw_device_ctx);
  if (hw_frames_ref == NULL) {
    fprintf(stderr, "Failed to create CUDA frame context.\n");
    goto error;
  }

  frames_ctx = (AVHWFramesContext *)(hw_frames_ref->data);
  frames_ctx->format    = AV_PIX_FMT_CUDA;
  frames_ctx->sw_format = AV_PIX_FMT_YUV420P;
  frames_ctx->width     = codec_context->width;
  frames_ctx->height    = codec_context->height;
  frames_ctx->initial_pool_size = 20;

  if (av_hwframe_ctx_init(hw_frames_ref) < 0) {
    fprintf(stderr, "Failed to initialize CUDA frame context\n");
    goto error;
  }

  codec_context->hw_frames_ctx = av_buffer_ref(hw_frames_ref);
  if (codec_context->hw_frames_ctx == NULL){
    fprintf(stderr, "Failed to set hw frame reference\n");
    goto error;
  }

  av_buffer_unref(&hw_frames_ref);
  return 0;

error:
  if(hw_frames_ref){
    av_buffer_unref(&hw_frames_ref);
  }

  return -1;
}

// Setup the H.264 codec using GPU. This will create and initialize the codec.
// You may set different codec options here and allocate GPU buffers for 
// frame encoding.
AVCodecContext *get_codec_context(int width, int height, int fps, int bitrate, 
                                                      RTSPStream *rtsp_stream){

  AVCodec *codec = NULL;
  AVCodecContext *codec_context = NULL;
  AVDictionary *codec_options = NULL;

  // Get NVENC H.264 Codec
  const char* encoder_name = "h264_nvenc";
  codec = avcodec_find_encoder_by_name(encoder_name);
  if(codec == NULL){
    fprintf(stderr,"unable to find codec\n");
    goto error;    
  }

  codec_context = avcodec_alloc_context3(codec);
  if(codec_context == NULL){
    fprintf(stderr,"unable to allocate codec\n");
    goto error;
  }

  // Fine grained options can be set here
  codec_context->rc_max_rate = bitrate;
  codec_context->rc_min_rate = bitrate;
  codec_context->width = width;
  codec_context->height = height;
  codec_context->bit_rate = bitrate;
  codec_context->time_base= (AVRational){1,fps};
  codec_context->keyint_min = 999999;
  codec_context->rc_buffer_size = bitrate/fps;
  codec_context->pix_fmt = AV_PIX_FMT_CUDA;

  // Options for NVENC H.264 using defined options
  if(av_dict_set(&codec_options, "preset", "llhp", 0) < 0){
    fprintf(stderr,"unable to set to codec option\n");
    goto error;
  }
  if(av_dict_set(&codec_options, "rc", "cbr_ld_hq", 0) < 0){
    fprintf(stderr,"unable to set to codec option\n");
    goto error;
  }
  if(av_dict_set(&codec_options, "profile", "high", 0) < 0){
    fprintf(stderr,"unable to set to codec option\n");
    goto error;
  }

  if(av_hwdevice_ctx_create(&rtsp_stream->hw_device_ctx, AV_HWDEVICE_TYPE_CUDA,
                                                           NULL, NULL, 0) < 0){
    fprintf(stderr,"unable to open device\n");
    goto error;
  }

  // Allocates GPU buffers for frame encoding.
  if(set_hwframe_ctx(codec_context, rtsp_stream->hw_device_ctx) < 0){
    fprintf(stderr,"unable to allocate hw frames\n");
    goto error;    
  }

  if(avcodec_open2(codec_context, codec, &codec_options) < 0){
    fprintf(stderr,"could not open codec\n");
    goto error;
  }

  return codec_context;

error:
  if(codec_context){
    avcodec_free_context(&codec_context);
  }

  if(rtsp_stream->hw_device_ctx){
    av_buffer_unref(&rtsp_stream->hw_device_ctx);
  }

  return NULL;
}

// Allocates a Frame to hold the BGRA -> YUV420P conversion. A single frame is
// used for the conversion to reduce extra memory allocations when more than
// one of the same frame is sent. More than one frame is sent due to buffering
// however if not sending more than one of the same frame the overhead is a GPU
// mem copy between this frame and the buffers allocated from set_hwframe_ctx.
AVFrame *get_av_frame(AVCodecContext *codec_context) {
  AVFrame *frame = NULL;

  frame = av_frame_alloc();
  if(frame == NULL){
    fprintf(stderr, "unable to allocate frame\n");
    goto error;
  }

  frame->height = codec_context->height;
  frame->width = codec_context->width;
  frame->format = codec_context->pix_fmt;
  frame->pts = 0;

  frame->data[0] = nppiMalloc_8u_C1(frame->width, frame->height, 
                                                          &frame->linesize[0]);
  if(frame->data[0] == NULL){
    fprintf(stderr, "unable to allocate gpu memory\n");
    goto error;
  }

  frame->data[1] = nppiMalloc_8u_C1(frame->width/2, frame->height/2, 
                                                          &frame->linesize[1]);
  if(frame->data[1] == NULL){
    fprintf(stderr, "unable to allocate gpu memory\n");
    goto error;
  }

  frame->data[2] = nppiMalloc_8u_C1(frame->width/2, frame->height/2, 
                                                          &frame->linesize[2]);
  if(frame->data[2] == NULL){
    fprintf(stderr, "unable to allocate gpu memory\n");
    goto error;
  }

  return frame;

error:
  if(frame){
    if(frame->data[0]){
      nppiFree(frame->data[0]);
    }
    if(frame->data[1]){
      nppiFree(frame->data[1]);
    }
    if(frame->data[2]){
      nppiFree(frame->data[2]);
    }
    av_frame_free(&frame);
  }

  return NULL;
}

// This function will set up the H.264 codec using the GPU as well as set up
// the muxer to use the rtsp endpoint specified. In addition to this some
// necessary GPU information and data is initialized and allocated. In
// particular a GPU buffer is allocated to hold BGRA image data for the 
// YUV420P conversion and necessary parameters for the conversion.
int init_rtsp_stream(RTSPStream *rtsp_stream, int width, int height, int fps, 
                                            int bitrate, const char *endpoint){

  rtsp_stream->codec_ctx = NULL;
  rtsp_stream->endpoint = NULL;
  rtsp_stream->frame = NULL;
  rtsp_stream->ofmt_ctx = NULL;
  rtsp_stream->out_stream = NULL;
  rtsp_stream->hw_device_ctx = NULL;
  rtsp_stream->cuda_data = NULL;

  av_register_all();

  if(avformat_network_init() < 0){
    fprintf(stderr,"unable to init network\n");
    goto error; 
  }

  rtsp_stream->codec_ctx = get_codec_context(width, height, fps, bitrate, 
                                                                  rtsp_stream);
  if(rtsp_stream->codec_ctx == NULL){
    fprintf(stderr,"unable to obtain encoding context\n");
    goto error;
  }

  // Allocates a Frame that will hold the YUV420P converted data
  rtsp_stream->frame = get_av_frame(rtsp_stream->codec_ctx);
  if(rtsp_stream->frame == NULL){
    fprintf(stderr,"unable to allocate frame\n");
    goto error;
  }

  rtsp_stream->endpoint = endpoint;
	if (avformat_alloc_output_context2(&rtsp_stream->ofmt_ctx, NULL, "rtsp", 
                                                   rtsp_stream->endpoint) < 0){
		fprintf(stderr,"could not create output context\n");
    goto error;
	}

  rtsp_stream->out_stream = avformat_new_stream(rtsp_stream->ofmt_ctx, 
                                                rtsp_stream->codec_ctx->codec);
	if (rtsp_stream->out_stream == NULL) {
		fprintf(stderr,"failed allocating output stream\n");
		goto error;
  }

  if(avcodec_parameters_from_context(rtsp_stream->out_stream->codecpar, 
                                                  rtsp_stream->codec_ctx) < 0){
		fprintf(stderr,"failed to copy context from input to output stream codec 
                                                                   context\n");
		goto error;
  }

  // Optional: Print details of the rtsp stream
  av_dump_format(rtsp_stream->ofmt_ctx, 0, rtsp_stream->endpoint, 1);

	if (!(rtsp_stream->ofmt_ctx->oformat->flags & AVFMT_NOFILE)) {
		if(avio_open(&rtsp_stream->ofmt_ctx->pb, rtsp_stream->endpoint, 
                                                         AVIO_FLAG_WRITE) < 0){
			fprintf(stderr,"could not open output url '%s'\n", 
                                                        rtsp_stream->endpoint);
      goto error;
    }
	}

  rtsp_stream->cuda_data = nppiMalloc_8u_C4(width, height, 
                                                  &rtsp_stream->cuda_linesize);
  if(rtsp_stream->cuda_data == NULL){
  	fprintf(stderr,"could not allocate cuda buffer\n");
    goto error;  
  }
  rtsp_stream->ROI.width = width;
  rtsp_stream->ROI.height = height;

  return 0;

error:

  if(rtsp_stream->frame){
    if(rtsp_stream->frame->data[0]){
      nppiFree(rtsp_stream->frame->data[0]);
    }
    if(rtsp_stream->frame->data[1]){
      nppiFree(rtsp_stream->frame->data[1]);
    }
    if(rtsp_stream->frame->data[2]){
      nppiFree(rtsp_stream->frame->data[2]);
    }
    av_frame_free(&rtsp_stream->frame);
  }

  if(rtsp_stream->codec_ctx) {
    avcodec_free_context(&rtsp_stream->codec_ctx);
  }

  if(rtsp_stream->ofmt_ctx){
    if(!(rtsp_stream->ofmt_ctx->flags & AVFMT_NOFILE)){
      //Check Error
      avio_close(rtsp_stream->ofmt_ctx->pb);
    }
	  avformat_free_context(rtsp_stream->ofmt_ctx);
  }

  if(rtsp_stream->hw_device_ctx){
    av_buffer_unref(&rtsp_stream->hw_device_ctx);
  }

  return -1;
}

// Starts RTSP Stream. This describes the stream to the rtsp server. It also
// sends the rtsp SETUP request to the server which must be successful to send
// frames to the server. The stream must also be closed using end_rtsp_stream.
// If not closed then the rtsp server will leave the stream open at the
// specified in init_rtsp_stream.
int start_rtsp_stream(RTSPStream *rtsp_stream){
  if(avformat_write_header(rtsp_stream->ofmt_ctx, NULL) < 0){
		fprintf(stderr,"error occurred when opening output URL\n");
    return -1;
  }
  return 0;
}

// Ends the RTSP Stream. This will send the appropriate TEARDOWN request to the
// rtsp server in order to close the stream. If this function is not called
// at the end of an rtsp stream then the stream will remain open on the server
// the endpoint specified in init_rtsp_stream cannot be re-used.
int end_rtsp_stream(RTSPStream *rtsp_stream){
  if(av_write_trailer(rtsp_stream->ofmt_ctx)){
    fprintf(stderr, "unable to write trailer\n");
    return -1;
  }
  return 0;
}

// Frees all allocated memory. Should be called after end_rtsp_stream.
int free_rtsp_stream(RTSPStream *rtsp_stream){

  if(rtsp_stream->frame){
    if(rtsp_stream->frame->data[0]){
      nppiFree(rtsp_stream->frame->data[0]);
    }
    if(rtsp_stream->frame->data[1]){
      nppiFree(rtsp_stream->frame->data[1]);
    }
    if(rtsp_stream->frame->data[2]){
      nppiFree(rtsp_stream->frame->data[2]);
    }
    av_frame_free(&rtsp_stream->frame);
  }

  if(rtsp_stream->cuda_data){
    nppiFree(rtsp_stream->cuda_data);
  }

  if(rtsp_stream->codec_ctx) {
    avcodec_free_context(&rtsp_stream->codec_ctx);
  }

  if(rtsp_stream->ofmt_ctx){
    if(!(rtsp_stream->ofmt_ctx->flags & AVFMT_NOFILE)){
      //Error Check
      avio_close(rtsp_stream->ofmt_ctx->pb);
    }
	  avformat_free_context(rtsp_stream->ofmt_ctx);
  }

  if(rtsp_stream->hw_device_ctx){
    av_buffer_unref(&rtsp_stream->hw_device_ctx);
  }

  return 0;
}

// Convert image from BGRA -> YUV420P and send to encoder. Then retrieves
// encoded frame as a packet and sends to the open rtsp stream. Bufsize is set
// to 1 for standard usage. If trying to eliminate frame latency you can change
// this to the size of the encoders buffer. This is however many frames that
// must be sent to the encoder to retrieve the first encoded packet.
int write_image_to_rtsp_stream(RTSPStream *rtsp_stream, BMPImage *image){

  int i;
  int bufsize = 1;
  int retval;
  AVPacket pkt;
  AVFrame *hw_frame = NULL;

  // Copy image to GPU memory and convert from BGRA -> YUV420P, storing the
  // YUV data in the frame member of rtsp_stream.
  if(load_image_into_frame(rtsp_stream, image) < 0){
    fprintf(stderr,"failed to load image into frame\n");
    goto error;
  }

  // Loop to send multiple of the same frame if bufsize > 1
  for (i = 0; i < bufsize; i++){

    // Initial pts value is 0, this must be incremented for each frame sent
    // otherwise the encoder doesn't know where this frame should be in time.
    rtsp_stream->frame->pts++;

    // Gets a frame and sets the data members to point to GPU buffers
    hw_frame = av_frame_alloc();
    if(hw_frame == NULL){
      fprintf(stderr, "unable to allocate hw frame\n");
      goto error;
    }
    if(av_hwframe_get_buffer(rtsp_stream->codec_ctx->hw_frames_ctx, hw_frame,
                                                                       0) < 0){
      fprintf(stderr, "unable to allocate hw frame buffer\n");
      goto error;  
    }

    // Copies the YUV420P data from the frame member of rtsp_stream to the GPU
    // buffer specified by hw_frame. Both of these data portions reside on the
    // GPU. It is necessary for ffmpeg to use the GPU buffers in the pool
    // created as the data sits in memory by the encoder until it isn't needed
    // anymore.
    if(cudaMemcpy2D(hw_frame->data[0], hw_frame->linesize[0], 
                    rtsp_stream->frame->data[0], 
                    rtsp_stream->frame->linesize[0], image->header.width_px, 
                    image->header.height_px, 
                                     cudaMemcpyDeviceToDevice) != cudaSuccess){
      fprintf(stderr, "unable to copy y plane\n");
      goto error;    
    }
    if(cudaMemcpy2D(hw_frame->data[1], hw_frame->linesize[1], 
                    rtsp_stream->frame->data[1], 
                    rtsp_stream->frame->linesize[1], image->header.width_px/2, 
                    image->header.height_px/2, 
                                     cudaMemcpyDeviceToDevice) != cudaSuccess){
      fprintf(stderr, "unable to copy u plane\n");
      goto error;  
    }
    if(cudaMemcpy2D(hw_frame->data[2], hw_frame->linesize[2], 
                    rtsp_stream->frame->data[2], 
                    rtsp_stream->frame->linesize[2], image->header.width_px/2,
                    image->header.height_px/2, 
                                     cudaMemcpyDeviceToDevice) != cudaSuccess){
      fprintf(stderr, "unable to copy v plane\n");
      goto error;  
    }
    hw_frame->pts = rtsp_stream->frame->pts;

    // Send the frame to the encoder
    if(avcodec_send_frame(rtsp_stream->codec_ctx, hw_frame) < 0){
      fprintf(stderr,"error sending frame to encoder\n");
      goto error;
    }

    av_init_packet(&pkt);
    pkt.data = NULL;
    pkt.size = 0;

    // Received encoded packet from the encoder
    retval = avcodec_receive_packet(rtsp_stream->codec_ctx, &pkt);

    // EAGAIN and EOF are acceptable error codes. So we can ignore them. The
    // encoded is not ready to send an encoded packet yet. It will need more
    // frames sent to it via avcodec_send_frame.
    if (retval == AVERROR(EAGAIN) || retval == AVERROR_EOF){  
    } else if (retval < 0){
      fprintf(stderr,"error receiving packet\n");
      goto error;
    } else {
      //Writes the encoded packet to the rtsp stream.
      if(av_interleaved_write_frame(rtsp_stream->ofmt_ctx, &pkt) < 0){
        fprintf(stderr,"error writing packet to rtsp stream\n");
        goto error;
      }
    }

    av_packet_unref(&pkt);
    av_frame_free(&hw_frame);
  }

  return 0;

error:
  av_packet_unref(&pkt);

  if(hw_frame){
    av_frame_free(&hw_frame);
  }
  return -1;
}

// Convert image from BGRA -> YUV420P and store in Frame
int load_image_into_frame(RTSPStream *rtsp_stream, BMPImage *image){

  // Copy image into GPU memory
  if(cudaMemcpy2D(rtsp_stream->cuda_data, rtsp_stream->cuda_linesize, 
                  image->data, rtsp_stream->cuda_linesize, 
                  image->header.width_px*4, image->header.height_px, 
                                       cudaMemcpyHostToDevice) != cudaSuccess){
    fprintf(stderr,"failed to copy image to cuda\n");
    return -1;
  }

  // Converts BGRA -> YUV420P and stores YUV420P data in Frame
  if(nppiBGRToYUV420_8u_AC4P3R(rtsp_stream->cuda_data, 
                               rtsp_stream->cuda_linesize, 
                               rtsp_stream->frame->data, 
                               rtsp_stream->frame->linesize, 
                                             rtsp_stream->ROI) != NPP_SUCCESS){
    fprintf(stderr,"failed to convert bgra to yuv420p\n");
    return -1;    
  }

  return 0;
}