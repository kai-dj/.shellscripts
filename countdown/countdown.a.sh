#!/usr/bin/env bash
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <name> <date parsable by \`date\`>" >&2
elif [ "$#" -lt 2  ]; then
  rm ~/.shellscripts/countdown/files/"$1"
else
  TIMESTAMP=$(date "+%Y-%m-%dT%H:%M:%S" -d "${*:2}")
  FILE=~/.shellscripts/countdown/files/"$1"
  echo $(date --iso-8601=seconds -d "$TIMESTAMP")';0:#ffff00,7200:#ff6600,14400:#ff0000;#00ff00:#00ff00' > "$FILE"
fi
