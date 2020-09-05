#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo apt install git -y
sudo groupadd docker
sudo usermod -aG docker iheart
newgrp docker 
sudo systemctl enable docker
sudo systemctl start docker
git clone --recursive https://github.com/Parisson/TimeSide.git
cd TimeSide
docker-compose pull