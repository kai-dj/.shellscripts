#!/bin/sh
# generate random password

if (( $# != 1 )); then 
    shuf -zer -n20 {0..9} {A..Z} {a..z} {ä,Ä,ö,Ö,ü,Ü,ß,"?","§","$","%","&","/","(",")","=","+","#","µ","@","-","ß","!"}; echo
else 
    shuf -zer -n"$@" {0..9} {A..Z} {a..z} {ä,Ä,ö,Ö,ü,Ü,ß,"?","§","$","%","&","/","(",")","=","+","#","µ","@","-","ß","!"}; echo
fi

#if (( $# != 1 )); then 
#  date +%s | sha256sum | base64 | head -c 32; echo; 
#else 
#  date +%s | sha256sum | base64 | head -c "$@"; echo; 
#fi
