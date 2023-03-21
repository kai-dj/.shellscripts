#!/usr/bin/env sh
# show qr code from parameter text
tmpqr='/tmp/aik_qr.png'
qrencode -s 5 -m 1 -o $tmpqr -l H "$1"
display $tmpqr
