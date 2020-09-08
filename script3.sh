#!/bin/bash
sudo mkdir media
sleep 300
sudo docker run -d -p 8000:8000 -v /home/ubuntu/media:/home/streamripper clue/streamripper http://iheart.streamguys1.com:8080/0017 -o version
sleep 300
sudo docker run -d -p 80:80 -v /home/ubuntu/media:/var/www clue/h5ai
sleep 300