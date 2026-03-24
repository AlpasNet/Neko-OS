#!/bin/bash

URL="https://discord.com/api/download/stable?platform=linux&format=deb"
FILENAME="/tmp/discord.deb"

wget -O "$FILENAME" "$URL"
if [ $? -ne 0 ]; then
    echo "Download Failed! Running Discord without update."
    exec /usr/bin/discord
    exit 0
fi

pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY dpkg -i "$FILENAME"
if [ $? -ne 0 ]; then
    exec /usr/bin/discord
    exit 0
fi

rm -f "$FILENAME"
echo "Discord Updated! Launching..."

rm &FILENAME
exec /usr/bin/discord
