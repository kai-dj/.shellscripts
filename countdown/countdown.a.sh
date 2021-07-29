#!/usr/bin/env bash
if [[ $1 == of* ]]; then
  echo "off" > ~/.shellscripts/countdown/file
else
  TIMESTAMP=$(date "+%Y-%m-%dT%H:%M:%S" -d "$*")
  date --iso-8601=seconds -d "$TIMESTAMP" > ~/.shellscripts/countdown/file
fi
