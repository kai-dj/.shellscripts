#!/usr/bin/env sh
# wait a second, then turn off monitor
sleep 1 && xset -display :0.0 dpms force off
# turn off numlock if numlockx is available
if [ -x "$(command -v numlockx)" ]; then
    numlockx off;
fi
