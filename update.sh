#!/bin/bash
# Creation / Update of Neko-OS

# Install all required dependencies
sudo apt update
sudo apt upgrade

sudo apt install v4l-utils vlc alsa-utils pulseaudio-utils python3-gi openjdk-25-jdk

# Capture Stream
# A Better Way to get the stream from capture cards
# Note : Tested with Discord
wget -O capture-stream.tar.gz https://github.com/pairomaniac/capture-stream/archive/refs/tags/v2.0.3.tar.gz
tar -xf capture-stream.tar.gz
cd capture-stream-2.0.3
sudo ./capture-stream-install.sh
cd ..
rm -dR capture-stream*

# Minecraft Bedrock Linux Launcher
# Note : You must buy the Android version on Google Play
curl -sS https://minecraft-linux.github.io/pkg/deb/pubkey.gpg | sudo tee /etc/apt/trusted.gpg.d/minecraft-linux-pkg.asc
# echo "deb [arch=amd64,arm64] https://minecraft-linux.github.io/pkg/deb noble main" | sudo tee /etc/apt/sources.list.d/minecraft-linux-pkg.list
echo "deb [arch=amd64,arm64] https://minecraft-linux.github.io/pkg/deb noble-nightly main" | sudo tee /etc/apt/sources.list.d/minecraft-linux-pkg.list
sudo apt update
sudo apt install mcpelauncher-manifest mcpelauncher-ui-manifest msa-manifest

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt install spotify-client

# Discord
wget -O "/tmp/discord.deb" "https://discord.com/api/download/stable?platform=linux&format=deb"
pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY dpkg -i "/tmp/discord.deb"
rm -f "/tmp/discord.deb"

# Steam
wget -O "/tmp/steam.deb" "https://cdn.fastly.steamstatic.com/client/installer/steam.deb"
pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY dpkg -i "/tmp/steam.deb"
rm -f "/tmp/steam.deb"

# Only Office
wget -O "/tmp/onlyoffice-desktopeditors_amd64.deb" "https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb"
pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY dpkg -i "/tmp/onlyoffice-desktopeditors_amd64.deb"
rm -f "/tmp/onlyoffice-desktopeditors_amd64.deb"

# GIMP
wget -O "$HOME/Programs/GIMP.AppImage" "https://download.gimp.org/gimp/v3.2/linux/GIMP-3.2.2-x86_64.AppImage"

