#!/bin/sh
xrandr --output eDP1 --primary --mode 1920x1200 --pos 0x960 --rotate normal \
       --output DP3 --scale 1x1 --mode 3840x2160 --pos 1920x0 --rotate normal &&
xrandr --output eDP1 --primary --mode 1920x1200 --pos 0x420 --rotate normal \
       --output DP3 --scale 0.75x0.75 --mode 3840x2160 --pos 1920x0 --rotate normal
