#!/bin/sh
# connect to device tethering wifi
#
adb kill-server
adb connect 192.168.43.1:5555
