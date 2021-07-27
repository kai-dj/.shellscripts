#!/bin/sh
xterm -bg black -fg white -geometry 111x33 &
sleep 0.1 &&
if [ -x "$(command -v transset-df)" ]; then    
    #TODO also check for xcompmgr running
    transset-df -a 0.6;    
fi

i3-msg "floating toggle";

