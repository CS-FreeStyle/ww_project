#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/time.h> 
#include <unistd.h>

#include "myav.h"

int main(int argc, char **argv){

  FILE *infile = NULL;
  int bmpfile;
  char buffer[2048];

  RTSPStream rtsp_stream;
  BMPImage image;

  int retval;

  if(argc != 3){
    fprintf(stderr,"bad invocation\n");
    fprintf(stderr,"./test bmp_file rtsp_stream\n");
    return -1;
  }

  // API CALL
  retval = init_rtsp_stream(&rtsp_stream, 1920, 1080, 60, 9000000, argv[2]);
  printf("init_rtsp_stream = %d\n", retval);
  if(retval < 0){
    return -1;
  }

  // API CALL
  retval = start_rtsp_stream(&rtsp_stream);
  printf("start_rtsp_stream = %d\n", retval);
  if(retval < 0){
    free_rtsp_stream(&rtsp_stream);
    return -1;
  }

  if((infile = fopen(argv[1], "rb")) == NULL){
    fprintf(stderr,"unable to open input file %s\n", argv[1]);
  }

  int frame = 0;
  struct timespec start, end;
  float start_time, end_time, diff_time = 0;
  

  memset(buffer,0,2048);
  while(fgets(buffer, 1024, infile) != NULL){
    buffer[strlen(buffer)-1] = 0;

    if((bmpfile = open(buffer, O_RDONLY)) < 0){
      fprintf(stderr,"error opening file\n");
    }

    if((read(bmpfile, &image.header, BMP_HEADER_SIZE)) != BMP_HEADER_SIZE){
      fprintf(stderr,"error reading bmp header\n");
    }

    int i;
    image.data = (char *)malloc(image.header.size - image.header.offset);
    for(i = image.header.width_px*(image.header.height_px-1)*4; i >= 0; i-=image.header.width_px*4){
      if((read(bmpfile, &image.data[i], image.header.width_px*4)) != image.header.width_px*4){
        fprintf(stderr, "unable to read rgba data\n");
      }
    }
    close(bmpfile);
    memset(buffer,0,2048);

    clock_gettime(CLOCK_MONOTONIC, &start);
    start_time = start.tv_sec*1000000000 + start.tv_nsec;
  
    // API CALL
    // Can take time measurement here to get time to send encode and send frame to rtsp
    write_image_to_rtsp_stream(&rtsp_stream, &image);
    
    clock_gettime(CLOCK_MONOTONIC, &end);
    end_time = end.tv_sec*1000000000 + end.tv_nsec;
    diff_time += end_time - start_time;
    frame++;

    if (diff_time > 1000000000){
      printf("fps: %d\n", frame);
      frame = 0;
      diff_time = 0;
    }

    free(image.data);
  }

  fclose(infile);

  retval = end_rtsp_stream(&rtsp_stream);
  printf("end_rtsp_stream = %d\n", retval);

  retval = free_rtsp_stream(&rtsp_stream);
  printf("free_rtsp_stream = %d\n", retval);

  return 0;
}