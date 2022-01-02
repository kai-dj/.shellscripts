#!/usr/bin/env bash
DESCRIPTION="Script using xdotool to type email address."
beep
if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  #exit 0
fi

xdotool type "kai.lueking" &&
xdotool key U0040 &&
xdotool type "gmail.com"
#xdotool type "monday-consulting.com"
