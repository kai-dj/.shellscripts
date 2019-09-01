#!/bin/bash
#serve directory and show local ip
localip=$(ip route get 1.2.3.4|cut -d " " -f7 | xargs)
port=9090
echo "serving ""$(pwd)"" on ""$localip"":""$port"
python2 -m SimpleHTTPServer $port
