#!/bin/bash

sudo apt-get update

### Install Docker

# Install Docker
echo "Installing docker"
sudo wget -qO- https://get.docker.com | sh


sudo usermod -aG docker ubuntu

sleep 60
### Building docker image and running it for headless browser
sudo docker build -t headless /tmp/headless/.

sudo docker run -d -p 3000:9222 --name headless headless


### Building docker image and running it as a GUI browser

sudo docker build -t gui /tmp/gui/.

sudo docker run -d -p 3001:9222 --name gui gui




