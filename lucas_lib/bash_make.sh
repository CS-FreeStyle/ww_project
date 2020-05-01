#!/bin/bash

gcc -o test test_lib.c myav.c -lavutil -lavformat -lswscale -lavfilter -lavdevice -lpostproc -lswresample
