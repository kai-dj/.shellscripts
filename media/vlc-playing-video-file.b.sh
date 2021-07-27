#!/usr/bin/env bash
lsof -wc vlc \
  | awk '$4~"[0-9]r" && $5=="REG"' \
  | grep -o \
    -e '/.*.mp4' \
    -e '/.*.avi' \
    -e '/.*.flv' \
    -e '/.*.mkv' \
    -e '/.*.mpg' \
    -e '/.*.wmv'
