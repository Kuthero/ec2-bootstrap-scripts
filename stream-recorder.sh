#!/bin/bash
sudo timedatectl set-timezone America/New_York
sleep 3
sudo docker run --name ffmpeg -d -v /etc/localtime:/etc/localtime:ro -v='/home/ubuntu/audio':/tmp/ffmpeg opencoconut/ffmpeg -i https://player.iheart-us1.zettacloud.com/03767a3b-798d-047f-95dc-637046c2ca7b/d2e6ffc8-963a-27a5-3609-1bce6d2b145e/ksvr-00001 -f segment -strftime 1 -segment_time 60 -reset_timestamps 1 tiger-team-radio-%m-%d_%H-%M-%S.mp3
sleep 3
sudo docker run --name filebrowser -d -p 80:80 -v /home/ubuntu/audio:/var/www clue/h5ai
sleep 3
sudo rm /home/ubuntu/audio/supervisord.log
sudo rm /home/ubuntu/audio/supervisord.pid