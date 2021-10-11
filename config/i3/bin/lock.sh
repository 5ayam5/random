#!/bin/bash
icon="$HOME/Pictures/lock.png"
# create a temp file
img=$(mktemp /tmp/XXXXXXXXXX.png)
# Copy lock screen background to img (helps in converting to png if format is different)
convert $HOME/Pictures/Wallpapers/aDreamyWorld.jpg $img
# Pixelate the screenshot
convert $img -scale 10% -scale 1000% $img
# Alternatively, blur the screenshot (slow!)
#convert $img -blur 2,5 $img
# Add the lock image
convert $img $icon -gravity center -composite $img
# Run i3lock with custom background
i3lock -u -i $img
# Remove the tmp file
rm $img
