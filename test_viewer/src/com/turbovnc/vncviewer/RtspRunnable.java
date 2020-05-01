package com.turbovnc.vncviewer;

import org.bytedeco.ffmpeg.global.avcodec;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.bytedeco.javacv.Java2DFrameConverter;

public class RtspRunnable implements Runnable {

	FFmpegFrameGrabber grabber;
	Frame frame;
	Java2DFrameConverter converter;
	DesktopWindow desktop;
	String servername;
	boolean running;

	public RtspRunnable(DesktopWindow _desktop, String _servername) {
		desktop = _desktop;
		servername = "rtsp://"+_servername+"/live306";
		converter = new Java2DFrameConverter();
		grabber = new FFmpegFrameGrabber(servername);
		grabber.setVideoCodec(avcodec.AV_CODEC_ID_H264);

		// Set codec options, unsure if these are actually implemented
		// grabber.setVideoOption();

		running = true;
	}

	@Override
	public void run() {
		try {
			
			int framenum = 0;
			long fps_start = System.nanoTime();
			long decode_start;
			long end = 0;
			int i = 0;			//frame count to decode frame
			int bufsize = 3;	//size of h.264 buffer, drops duplicate frames
			
			grabber.start();
			while (running && (frame = grabber.grab()) != null) {
				if(i==0) {

					// Decode frame
					// Uncomment to get frame time to calculate input latency
					// and to get decode time.
//					decode_start = System.nanoTime();
					desktop.BImage = converter.convert(frame);
					desktop.repaint();
//					System.out.println((System.nanoTime() - decode_start) + "decode time");
//					System.out.println(System.nanoTime() + "frame time");

					// Calculating FPS
					framenum++;
					end = System.nanoTime();
					if(end-fps_start > 1000000000) {
						System.out.println(framenum +" fps");
						fps_start = end;
						framenum = 0;
					}
				}
				
				i++;
				i = i % bufsize;
			}
			grabber.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public synchronized void stop() {
		running = false;
	}
}
