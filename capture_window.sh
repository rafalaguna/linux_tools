#!/bin/bash
# Author: Rafa Laguna
# Twitter: @rafalagoon
# Licence: GPL v3
# Status: WIP ;)
# Description: Fairly simple and effective window video capture

if [ $# -eq 0 ]; then
	echo "File name needed:"
	echo -e "\t"$0" FILENAME"
	exit 1
fi

echo "Select the window you want to capture"
wininfo=`xwininfo`

IFS='\n'
win_w=`echo $wininfo | grep "Width:" | cut -d : -f 2 | tr -d ' '`
win_h=`echo $wininfo | grep "Height:" | cut -d : -f 2 | tr -d ' '`
win_x=`echo $wininfo | grep "Absolute upper-left X:" | cut -d : -f 2 | tr -d ' '`
win_y=`echo $wininfo | grep "Absolute upper-left Y:" | cut -d : -f 2 | tr -d ' '`

echo "Capturing..."
avconv -f x11grab -r 30 -s "$win_w"x"$win_h" -i :0.0+"$win_x","$win_y+nomouse" -vcodec libx264 -pre lossless_ultrafast -crf 0 -threads 0 "$1".mp4

echo "Compressing for editing..."
avconv -i "$1".mp4 -strict experimental -f mp4 -vcodec libx264 -preset slow -crf 1 "$1"_compress.mp4
