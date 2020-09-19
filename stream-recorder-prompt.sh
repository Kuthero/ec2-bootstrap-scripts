#!/bin/bash

echo Hello, welcome to stream recorder.
read -p 'Stream URL:' stream
read -p 'Station Name:' station
read -p 'Audio Segment Time (s):' segment_time
sleep 3
sudo docker run -d -v /etc/localtime:/etc/localtime:ro -v='/home/ubuntu/audio/'$station'':/tmp/ffmpeg opencoconut/ffmpeg -i $stream -f segment -strftime 1 -segment_time $segment_time -reset_timestamps 1 $station-%m-%d_%H-%M-%S.mp3
echo FFMPEG ripper is running. Please check output.
