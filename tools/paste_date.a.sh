#!/usr/bin/env bash
DESCRIPTION="Script using xdotool to type ISO 8601 fornmatted current date."

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi

#tmpfile=$(mktemp /tmp/clipboard-backup.XXXXXX)
#xsel -b > $tmpfile
CURRENT_DATE=$(echo -n "$(date +%Y-%m-%d-T%H:%M)")
#echo $CURRENT_DATE | xsel -ib
xdotool type "$CURRENT_DATE"
