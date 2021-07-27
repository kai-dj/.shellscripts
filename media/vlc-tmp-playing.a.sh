#!/usr/bin/env bash

FILE=$(vlc-playing-video-file)
if [ -f "$FILE" ]; then
  FILE=$(realpath "$FILE")
  DIRECTORY=$(dirname "$FILE")
  VOLUME_DIR=$(findmnt -n -T "$FILE" | cut -d ' ' -f 1)
  if [ "$VOLUME_DIR" == "/" ]; then
    VOLUME_TMP_DIR="$HOME""/tmp/000-root-tmp"
    VOLUME_TMP_SUB_DIR=${DIRECTORY/$VOLUME_DIR/}

  else
    VOLUME_TMP_DIR="$VOLUME_DIR""/tmp"
    VOLUME_TMP_SUB_DIR=${DIRECTORY/$VOLUME_DIR"/"}
  fi
  if [ ! -d "$VOLUME_TMP_DIR" ]; then
    echo volume tmp dir does not exist - creating "$VOLUME_TMP_DIR"
    mkdir "$VOLUME_TMP_DIR"
  else
    echo volume tmp dir \'"$VOLUME_TMP_DIR"\' exists
  fi

  echo moving "$FILE" to "$VOLUME_TMP_DIR""/""$VOLUME_TMP_SUB_DIR"
  mkdir -p "$VOLUME_TMP_DIR""/""$VOLUME_TMP_SUB_DIR"
  mv "$FILE" "$VOLUME_TMP_DIR""/""$VOLUME_TMP_SUB_DIR""/"
else
  echo vlc-playing-video-file \'"$FILE"\' is not a valid file
fi
