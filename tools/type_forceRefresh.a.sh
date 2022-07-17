#!/usr/bin/env bash
DESCRIPTION="Script using xdotool to type \`/forceRefresh=1\`."

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi
sleep 0.5
xdotool type "/forceRefresh=1"
