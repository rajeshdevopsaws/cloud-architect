#!/bin/bash

sudo apt-get update

### Install Docker

# Install Docker
echo "Installing docker"
sudo wget -qO- https://get.docker.com | sh

sudo usermod -aG docker ubuntu



# Download and install the CloudWatch Agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
rm -f ./amazon-cloudwatch-agent.deb

# Start the CloudWatch Agent service
sudo systemctl start amazon-cloudwatch-agent
sudo systemctl restart amazon-cloudwatch-agent


sleep 60
### Building docker image and running it for headless browser
sudo docker build -t headless /tmp/headless/.

sudo docker run -d -p 3000:9222 --name headless headless


### Building docker image and running it as a GUI browser

sudo docker build -t gui /tmp/gui/.

sudo docker run -d -p 3001:9222 --name gui gui


