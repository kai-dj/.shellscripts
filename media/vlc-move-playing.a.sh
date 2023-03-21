#!/usr/bin/env bash
FILE=$(vlc-playing-video-file) && echo moving "$FILE" && read && mv -v "$FILE" /run/media/kai/EXT_4TB/wrk/.xxx_check/ && echo moved "$FILE"