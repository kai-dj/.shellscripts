#!/usr/bin/env bash
TIMESTAMP=$(date "+%Y-%m-%dT%H:%M" -d "+8 hours +30 minutes")
case $TIMESTAMP in
    *[1234]) TIMESTAMP=${TIMESTAMP%?}0;;
    *[6789]) TIMESTAMP=${TIMESTAMP%?}5;;
esac
echo $(date --iso-8601=seconds -d "$TIMESTAMP")';0:#ffff00,7200:#ff6600,14400:#ff0000;#00ff00:#00ff00' > ~/.shellscripts/countdown/files/A
sync