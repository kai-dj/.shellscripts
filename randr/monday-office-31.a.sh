#!/bin/sh
xrandr --output eDP1 --primary --mode 1920x1200 --pos 0x240 --rotate normal \
       --output DP3 --mode 2560x1440 --pos 1920x0 --rotate normal \
       --output DP1 --off --output DP2 --off --output VIRTUAL1 --off
