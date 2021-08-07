#!/usr/bin/env sh
# inserts date via xdotool

# if german keyboard setxkbmap -layout de - special characters are displayed incorrectly if not
setxkbmap -layout de -variant nodeadkeys &&
# type date
xdotool type $(date +%Y-%m-%d_%H:%M)
