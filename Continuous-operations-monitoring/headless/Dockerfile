# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y firefox xvfb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up a virtual framebuffer for Firefox
ENV DISPLAY=:99

# Start Xvfb, the virtual framebuffer
CMD Xvfb $DISPLAY -ac -screen 0 1280x1024x16 & \
    sleep 5 && \
    firefox --headless --no-sandbox --disable-gpu --disable-software-rasterizer --disable-dev-shm-usage --remote-debugging-port=9222 http://google.com
