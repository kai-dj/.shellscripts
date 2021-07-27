#!/usr/bin/env bash

if [[ -n "$2" ]]
  then
    FFMPEG_COMMAND="ffmpeg -i ""$1"" -vcodec copy -acodec copy"
    CUT_BEGIN="$2"
    OUT_FILE="cutb_""$1"
    FFMPEG_COMMAND="${FFMPEG_COMMAND}"" -ss ""$2"" ""$OUT_FILE"
    FFMPEG_COMMAND
fi

if [[ -n "$3" ]]
  then
    FFMPEG_COMMAND="ffmpeg -i ""cutb_""$1"" -vcodec copy -acodec copy"
    CUT_END="$3"
    OUT_FILE="cutb_""cute_""$1"
    TTIME=$(( $(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "cutb_""$1" |cut -d\. -f1) - $3 ))
    FFMPEG_COMMAND="${FFMPEG_COMMAND}"" -t ""$TTIME"" ""$OUT_FILE"
    FFMPEG_COMMAND
fi
