#!/usr/bin/env bash
DESCRIPTION="Script using xdotool to type \`minus minus dollar dollar minus minus\`."

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi
sleep 1
xdotool key minus minus dollar dollar minus minus
