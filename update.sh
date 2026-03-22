#!/bin/bash
# Creation / Update of Neko-OS

# Install all required dependencies
sudo apt update
sudo apt upgrade

sudo apt install v4l-utils vlc alsa-utils pulseaudio-utils python3-gi

# Capture Stream
# A Better Way to get the stream from capture cards
# Note : Tested with Discord
wget -O capture-stream.tar.gz https://github.com/pairomaniac/capture-stream/archive/refs/tags/v2.0.2.tar.gz
tar -xf capture-stream.tar.gz
cd capture-stream-2.0.2
sudo ./capture-stream-install.sh
cd ..
rm -dR capture-stream*
