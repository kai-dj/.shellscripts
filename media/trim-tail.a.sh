#!/usr/bin/env bash

dur=$(ffprobe -i "$2" -show_entries format=duration -v quiet -of csv="p=0" | cut -d. -f1)
echo $dur
trim=$((dur - $1))
echo $trim
ffmpeg -i "$2" -t $trim -c copy -map 0 trimmed_"$2"
