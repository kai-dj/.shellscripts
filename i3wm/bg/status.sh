#!/bin/bash
# shell script to prepend i3status with more stuff

echo '{"version":1}'
echo '['

FIRST="true"

i3status | while :
do
    read line
    if [ "$(echo "$line" | cut -c 1-2)" = ',[' ]; then

        if [ "$FIRST" = "true" ]; then
            arraystart='['
            FIRST="false"
        else
            arraystart=',['
        fi
        arrayend=']'
        dateelement=${line:2:-1}
        weatherelement='{"name":"weather","color":"'$(cat /home/aik/.shellscripts/i3wm/bg/assets/weathercolor)'","markup":"none","full_text":"'$(cat /home/aik/.shellscripts/i3wm/bg/assets/weather)'"}'
        emptyelement='{"full_text":""}'
        echo "$arraystart""$weatherelement"",""$dateelement","$emptyelement""$arrayend" || exit 1
    fi



done
