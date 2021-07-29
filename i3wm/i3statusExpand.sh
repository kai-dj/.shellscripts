#!/usr/bin/env bash

# This i3status wrapper allows to add custom information in any position of the statusline
# It was developed for i3bar (JSON format)

# The idea is to define "holder" modules in i3status config and then replace them

# In order to make this example work you need to add
# order += "tztime holder__hey_man"
# and
# tztime holder__hey_man {
#        format = "holder__hey_man"
# }
# in i3staus config

# Don't forget that i3status config should contain:
# general {
#   output_format = i3bar
# }
#
# and i3 config should contain:
# bar {
#   status_command exec /path/to/this/script.sh
# }

# Make sure jq is installed
# That's it

# You can easily add multiple custom modules using additional "holders"

function update_holder() {

  local instance="$1"
  local replacement="$2"
  echo "$json_array" | jq --argjson arg_j "$replacement" "(.[] | (select(.instance==\"$instance\"))) |= \$arg_j"
}

function remove_holder() {

  local instance="$1"
  echo "$json_array" | jq "del(.[] | (select(.instance==\"$instance\")))"
}

#function hey_man() {
#
#  local rand_val=$((RANDOM % 3))
#  if [ $rand_val == 1 ]; then
#    local json='{ "full_text": "Hey Man!", "color": "#00FF00" }'
#    json_array=$(update_holder holder__hey_man "$json")
#  elif [ $rand_val == 0 ]; then
#    local json='{ "full_text": "Hey Man!", "color": "#FF0000" }'
#    json_array=$(update_holder holder__hey_man "$json")
#  else
#    json_array=$(remove_holder holder__hey_man)
#  fi
#}

function cdf() {
  countdownfile=~/.shellscripts/countdown/file
  if [[ $(cat $countdownfile) == of* ]]; then
    json_append='{ "full_text":" " }'
  else
    countdown_seconds=$(($(date -d "$(cat "$countdownfile")" +%s) - $(date +%s)))
    ##beep
    if [ $countdown_seconds -ge 14400 ]; then
      countdown_color='#ff0000'
    elif [ $countdown_seconds -ge 7200 ]; then
      countdown_color='#ff6600'
    elif [ $countdown_seconds -ge 0 ]; then
      countdown_color='#ffff00'
    else
      countdown_color='#00ff00'
    fi

    if [ $countdown_seconds -ge 0 ]; then
      countdown_sign='-'
      countdown_seconds_plus=$((countdown_seconds + 55))
    else
      countdown_seconds=$(($(date +%s) - $(date +%s -d "$(cat "$countdownfile")")))
      countdown_sign='+'
      countdown_seconds_plus=$((countdown_seconds))
    fi
    #countdown_formatted=" ""$countdown_sign""$(date -d@"$countdown_seconds_plus" -u +%H:%M)"" "
    days=$((countdown_seconds_plus / 86400))
    hours=$(((countdown_seconds_plus - (days * 86400)) / 3600))
    minutes=$(((countdown_seconds_plus - (hours * 3600) - (days * 86400)) / 60))
    display_hours=$(printf %02d $hours)
    display_minutes=$(printf %02d $minutes)
    if [ $days -eq 0 ]; then
      countdown_formatted=" ""$countdown_sign""$display_hours"":""$display_minutes"" "
    else
      countdown_formatted=" ""$countdown_sign""$days""d:""$display_hours"":""$display_minutes"" "
    fi
    json_append='{ "full_text":"'"$countdown_formatted"'", "color": "'"$countdown_color"'" }'
  fi
  #color": "'"$countdown_color"' }'
  json_array=$(update_holder holder__countdown "$json_append")
}

#!/bin/bash
# shell script to prepend i3status with more stuff

#echo '{"version":1}'
#echo '['
#
#FIRST="true"

#i3status | while :
#do
#    read line
#    if [ "$(echo "$line" | cut -c 1-2)" = ',[' ]; then
#
#        if [ "$FIRST" = "true" ]; then
#            arraystart='['
#            FIRST="false"
#        else
#            arraystart=',['
#        fi
#        arrayend=']'
#        dateelement=${line:2:-1}
#        weatherelement='{"name":"weather","color":"'$(cat /home/aik/.shellscripts/i3wm/bg/assets/weathercolor)'","markup":"none","full_text":"'$(cat /home/aik/.shellscripts/i3wm/bg/assets/weather)'"}'
#        emptyelement='{"full_text":""}'
#        echo "$arraystart""$weatherelement"",""$dateelement","$emptyelement""$arrayend" || exit 1
#    fi
#
#
#
#done



i3status -c ~/.config/i3/i3status.conf | (
  read line
  echo "$line"
  read line
  echo "$line"
  read line
  echo "$line"
  while true; do
    read line
    json_array="$(echo $line | sed -e 's/^,//')"
    cdf ~/.shellscripts/countdown/file
    echo ",$json_array"
  done
)
