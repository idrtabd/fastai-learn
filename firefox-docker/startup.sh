#!/bin/bash

# Start Xvfb
Xvfb -ac :99 -screen 0 1280x1024x16 &
XVFB=$!

# Wait for Xvfb to start
while ! xdpyinfo -display :99 > /dev/null 2>&1; do sleep 1; done

# Export display for Firefox
export DISPLAY=:99

# Start xterm
xterm &

# Start the VNC server
x11vnc -display :99 -N -forever
