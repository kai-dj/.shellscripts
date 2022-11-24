#!/usr/bin/env bash
DESCRIPTION="Script using xdotool to type \`_entwicklung_\`."

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi
sleep 1
xdotool key underscore e n t w i c k l u n g underscore
