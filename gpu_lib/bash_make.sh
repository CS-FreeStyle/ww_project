#!/bin/bash

gcc -o test test_lib.c myav.c -L./lib -L/usr/local/cuda/lib64 -I./include -I/usr/local/cuda/include -lavcodec -lavutil -lavformat -lswscale -lavfilter -lavdevice -lpostproc -lswresample -lpthread -lcudart -lnppisu -lnppicc
