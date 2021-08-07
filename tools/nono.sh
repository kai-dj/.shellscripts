#!/usr/bin/env sh
# start process - nohub - ignore stdout and stderr
nohup "$1" > /dev/null 2>&1 &
