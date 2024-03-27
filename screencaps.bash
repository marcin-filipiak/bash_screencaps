#!/bin/bash

# https://github.com/marcin-filipiak/bash_screencaps
#
# you need ffmpeg and mediainfo

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <video_file_path> <interval_in_seconds>"
    exit 1
fi

fullpath="$1"
interval="$2"
fname=$(basename "$1")

if [ ! -f "$fullpath" ]; then
    echo "File does not exist or cannot be read."
    exit 1
fi

if ! command -v mediainfo &> /dev/null; then
    echo "The program 'mediainfo' is not installed. Please install it and try again."
    exit 1
fi

duration=$(($(mediainfo --Inform="General;%Duration%" "${fullpath}")/1000))

echo "Video duration: $duration seconds."

for (( i=0; i <= $duration ; i=i+$interval )); do
 screenshot_time=$(convertsecs $i)
 echo "Capturing frame for time $screenshot_time (remaining: $(($duration-$i)) seconds)."
 ffmpeg -loglevel panic -y -ss $screenshot_time -i "$fullpath" -vframes 1 -q:v 2 "${i}_screenshot.jpg"
done

echo "Finished capturing frames from the video."

