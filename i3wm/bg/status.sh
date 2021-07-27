#!/bin/bash
# shell script to prepend i3status with more stuff

i3status | while :
do
    read line
    echo "myline $line" || exit 1
done
