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

function hey_man() {

  local rand_val=$((RANDOM % 3))
  if [ $rand_val == 1 ]; then
    local json='{ "full_text": "Hey Man!", "color": "#00FF00" }'
    json_array=$(update_holder holder__hey_man "$json")
  elif [ $rand_val == 0 ]; then
    local json='{ "full_text": "Hey Man!", "color": "#FF0000" }'
    json_array=$(update_holder holder__hey_man "$json")
  else
    json_array=$(remove_holder holder__hey_man)
  fi
}

function countdown() {
  countdown_seconds=$(($(date -d $(cat /home/kai/.feierabend) +%s) - $(date +%s)))

  if [ $countdown_seconds -ge 14400 ]; then countdown_color='#ff0000'
  elif [ $countdown_seconds -ge 7200 ]; then countdown_color='#ff6600'
  elif [ $countdown_seconds -ge 0 ]; then countdown_color='#ffff00'
  else countdown_color='#00ff00'
  fi

  if [ $countdown_seconds -ge 0 ]; then
    countdown_sign='-'
    countdown_seconds_plus=$(($countdown_seconds + 55))
  else
    countdown_seconds=$(($(date +%s) - $(date +%s -d $(cat /home/kai/.feierabend))))
    countdown_sign='+'
    countdown_seconds_plus=$(($countdown_seconds))
  fi
  countdown_formatted="$countdown_sign"$(date -d@"$countdown_seconds_plus" -u +%H:%M)


  local json='{ "full_text":"'"$countdown_formatted"'", "color": "'"$countdown_color"'" }'
  #color": "'"$countdown_color"' }'

  json_array=$(update_holder holder__hey_man "$json")

}

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
    countdown
    echo ",$json_array"
  done
)
