#!/usr/bin/env bash
#script for taking screenshot with scrot to clipboard
TEMP_PNG=$(mktemp --suffix=.png)
# temp file must be deleted, because scrot won't overwrite existing files :/
rm -f "$TEMP_PNG"
scrot -s "$TEMP_PNG"
xclip -selection clipboard -t image/png -i "$TEMP_PNG"
#do not delete file, relay on tmp beeing cleaned at reboot
#rm -f "$TEMP_PNG"
