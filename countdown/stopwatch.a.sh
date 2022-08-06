#!/usr/bin/env bash

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <name> <date parsable by \`date\`>" >&2
elif [ "$#" -lt 2  ]; then
  rm ~/.shellscripts/countdown/stopwatch/files/"$1"
else
  TIMESTAMP=$(date "+%Y-%m-%dT%H:%M:%S" -d "${*:2}")
  FILE=~/.shellscripts/countdown/stopwatch/files/"$1"
  date --iso-8601=seconds -d "$TIMESTAMP" > "$FILE"
fi
