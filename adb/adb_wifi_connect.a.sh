#!/usr/bin/env sh
# connect to device tethering wifi
#
ADDRESS='192.168.178.200:5555'

adb kill-server

if [ $# -ne 0 ]; then
  if [ $1 = "PIXEL" ]; then
    ADDRESS='192.168.178.151:5555'
  else
    ADDRESS="$1"
  fi
fi


adb connect "$ADDRESS"