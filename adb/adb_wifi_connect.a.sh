#!/usr/bin/env sh
# connect to device tethering wifi
#Run adb tcpip 5555 from a command prompt
#Run adb shell "ip addr show wlan0 | grep -e wlan0$ | cut -d\" \" -f 6 | cut -d/ -f 1" to obtain the phone's IP address
#Disconnect USB cable and run adb connect <ip_address>:5555
PORT='5555'
ADDRESS='192.168.178.200'
S21_ADDRESS='192.168.8.107' #'192.168.178.151'


adb kill-server

if [ $# -ne 0 ]; then
  if [ $1 = "S21" ]; then
    ADDRESS="$S21_ADDRESS"
  else
    ADDRESS="$1"
  fi
fi

adb connect "$ADDRESS"':'"$PORT"