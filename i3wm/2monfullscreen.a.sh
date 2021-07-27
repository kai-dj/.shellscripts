#!/usr/bin/env sh
# pseudo fullscreen over 2 full-hd  monitors in i3wm
#TODO add resolutions and stuff

i3-msg floating enable
xdotool getactivewindow windowmove 0 0
xdotool getactivewindow windowsize 3840 1080
