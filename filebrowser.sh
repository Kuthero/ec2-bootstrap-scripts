#!/bin/bash
sudo docker run --name filebrowser -d -p 80:80 -v /home/ubuntu/audio:/var/www clue/h5ai
sleep 3
sudo rm /home/ubuntu/audio/supervisord.log
sudo rm /home/ubuntu/audio/supervisord.pid
echo Files may now be browsed.