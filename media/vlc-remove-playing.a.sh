#!/usr/bin/env bash
FILE=$(vlc-playing-video-file) && echo remove "$FILE" && read && rm -f "$FILE" && echo removed "$FILE"