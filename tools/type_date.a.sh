#!/usr/bin/env bash
beep
DESCRIPTION="Script using xdotool to type ISO 8601 fornmatted current date."

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi

CURRENT_DATE=$(echo -n "$(date --iso-8601)")
xdotool type "$CURRENT_DATE"