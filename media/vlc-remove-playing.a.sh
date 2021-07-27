#!/usr/bin/env bash
FILE=$(vlc-playing-video-file) && rm -f "$FILE" && echo removed "$FILE"