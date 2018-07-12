#!/bin/sh
# generate random password
if (( $# != 1 )); then 
  date +%s | sha256sum | base64 | head -c 32; echo; 
else 
  date +%s | sha256sum | base64 | head -c "$@"; echo; 
fi
