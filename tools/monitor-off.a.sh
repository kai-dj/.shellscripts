#!/usr/bin/env bash
DESCRIPTION="Script to turn monitor off."

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi

sleep 0.1
xset dpms force off