#!/usr/bin/env bash
beep
DESCRIPTION="Script using xdotool to type ISO 8601 fornmatted current date."

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi

xdotool type --delay 50 "/anon +++] Fuse 3. Bazooka just 2* power. No freeze. Be nice :) [+++"