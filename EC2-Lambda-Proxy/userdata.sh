#!/bin/bash

sudo apt-get update

# Intall fire to run headless browser

sudo apt-get install -y firefox
sudo apt-get install libegl1

# Install Xvfb to run headless browser

sudo apt-get install -y xvfb



# # Run firefox in headless mode with url
Xvfb :10 -ac &
export DISPLAY=:10
firefox --headless --no-sandbox --disable-gpu --disable-extensions --new-window https://www.google.com

# # Run firefox in GUI mode with url
Xvfb :0 -ac &
export DISPLAY=:0
firefox --new-window https://www.google.com

firefox https://www.google.com

