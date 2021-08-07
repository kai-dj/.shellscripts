#!/usr/bin/env sh
# connect to device tethering wifi
#
adb kill-server

adb connect 192.168.8.102:5555
#adb connect 192.168.8.102:5555
#adb connect 192.168.0.111:5555
#adb connect 192.168.0.111:5555
