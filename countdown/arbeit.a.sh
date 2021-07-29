#!/usr/bin/env bash
TIMESTAMP=$(date "+%Y-%m-%dT%H:%M" -d "+8 hours +30 minutes")
case $TIMESTAMP in
    *[1234]) TIMESTAMP=${TIMESTAMP%?}0;;
    *[6789]) TIMESTAMP=${TIMESTAMP%?}5;;
esac
date --iso-8601=seconds  -d "$TIMESTAMP" > ~/.shellscripts/countdown/file