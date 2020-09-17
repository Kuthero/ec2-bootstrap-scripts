#!/bin/bash

#<> Variables here:
stream='https://player.iheart-us1.zettacloud.com/03767a3b-798d-047f-95dc-637046c2ca7b/d2e6ffc8-963a-27a5-3609-1bce6d2b145e/ksvr-00001'
timezone='America/New_York'
segment_time='60' #seconds
station='tiger-team-radio'

sudo timedatectl set-timezone $timezone
sleep 3
sudo docker run --name ffmpeg -d -v /etc/localtime:/etc/localtime:ro -v='/home/ubuntu/audio':/tmp/ffmpeg opencoconut/ffmpeg -i $stream -f segment -strftime 1 -segment_time $segment_time -reset_timestamps 1 $station-%m-%d_%H-%M-%S.mp3
sleep 3
sudo docker run --name filebrowser -d -p 80:80 -v /home/ubuntu/audio:/var/www clue/h5ai
sleep 3
sudo rm /home/ubuntu/audio/supervisord.log
sudo rm /home/ubuntu/audio/supervisord.pid