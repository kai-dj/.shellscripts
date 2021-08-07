#!/usr/bin/env bash

# get extension of a file

filename=$1
case $filename in
  (*.*) extension=${filename##*.};;
  (*)   extension="";;
esac
echo $extension
