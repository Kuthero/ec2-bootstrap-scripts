#!/bin/bash

#<> Variables here:
stream='http://iheart.streamguys1.com:8080/0106'
timezone='America/New_York'
segment_time='1800' #seconds
station='EVT10-FL-ZC-VT-TEST-3' #no spaces
#<>

sudo timedatectl set-timezone $timezone
sleep 3
sudo docker run --name ffmpeg -d -v /etc/localtime:/etc/localtime:ro -v='/home/ubuntu/audio':/tmp/ffmpeg opencoconut/ffmpeg -i $stream -f segment -strftime 1 -segment_time $segment_time -reset_timestamps 1 $station-%m-%d_%H-%M-%S.mp3
sleep 3
sudo docker run --name filebrowser -d -p 80:80 -v /home/ubuntu/audio:/var/www clue/h5ai
sleep 3
sudo rm /home/ubuntu/audio/supervisord.log
sudo rm /home/ubuntu/audio/supervisord.pid