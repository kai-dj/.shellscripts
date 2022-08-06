#!/usr/bin/env bash
source ~/.shellscripts/i3wm/kai3status/confHelper.sh
source ~/.shellscripts/countdown/countdown-funtions.sh

CONFIGFILE=~/.shellscripts/i3wm/kai3status/kai3status.conf
export K3S_SEPARATOR=""

function configHeader() {
  header='{ "version": 1, "click_events": true } ['
  echo "$header"
}
function freemem_in_gb() {
  prec=$1
  read -r _ weather_full_text_file _ <<<"$(grep --fixed-strings 'MemAvailable' /proc/meminfo)"
  bc <<<"scale=${prec:-1};${weather_full_text_file}/1024/1024"
}
function buildBattery() {
  battery_full_text=$(acpi | cut -d "," -f 2 | xargs)
  battery_color="#ffffff"
  BATTERYTRESHOLD=15
  disk_color="#ffffff"
  if (($(echo "${battery_full_text::-1} < $BATTERYTRESHOLD" | bc -l))); then
    battery_color="#ff0000"
  fi

  export K3S_SEPARATOR_TWO=","
  echo '{ "full_text":"'" B ""$battery_full_text "'", "color": "'"$battery_color"'", "name": "'"disk"'" }'","
}

function buildDisk() {
  disk_full_text=$(df -h / | cut -d " " -f 4 | xargs)
  DISKTRESHOLD=10
  disk_color="#ffffff"
  if (($(echo "${disk_full_text::-1} < $DISKTRESHOLD" | bc -l))); then
    disk_color="#ff0000"
  fi
  export K3S_SEPARATOR_TWO=","
  echo '{ "full_text":"'" D ""$disk_full_text "'", "color": "'"$disk_color"'", "name": "'"disk"'" }'","
}

function buildRam() {
  freemem_full_text=$(freemem_in_gb)
  MEMTRESHOLD=3
  freemem_color="#ffffff"
  if (($(echo "$freemem_full_text < $MEMTRESHOLD" | bc -l))); then
    freemem_color="#ff0000"
  fi
  export K3S_SEPARATOR_TWO=","
  echo '{ "full_text":"'" R ""$freemem_full_text "'", "color": "'"$freemem_color"'", "name": "'"ram"'" }'","
}

function buildWeather() {
  weather_full_text_file=~/.shellscripts/i3wm/bg/assets/weather
  weather_color="$(cat ~/.shellscripts/i3wm/bg/assets/weathercolor)"
  export K3S_SEPARATOR_TWO=","
  echo '{ "full_text":"'" $(cat $weather_full_text_file) "'", "color": "'"$weather_color"'", "name": "'"weather"'" }'","

}

function buildWorkLog() {
  weather_full_text_file=~/.shellscripts/i3wm/bg/assets/weather
  weather_color="$(cat ~/.shellscripts/i3wm/bg/assets/weathercolor)"
  export K3S_SEPARATOR_TWO=","
  echo '{ "full_text":"'" $(cat $weather_full_text_file) "'", "color": "'"$weather_color"'", "name": "'"weather"'" }'","

}

function buildTime() {
  #dateText=$(date +"%Y-%m-%d %H:%M:%S" -d @"$(($(date +%s) / 5 * 5))")
  dateText=$(date +"%Y-%m-%d %H:%M:%S" -d @"$(($(date +%s) / 5 * 5))")
  export K3S_SEPARATOR_TWO=","
  echo "{\"name\":\"tztime\",\"instance\":\"local\",\"markup\":\"none\",\"full_text\":\"" $dateText"\"}"","
}

function outputElement() {
  ARRAY="$1""$K3S_SEPARATOR""["
  ARRAY="$ARRAY"$(buildBattery)
  ARRAY="$ARRAY"$(buildDisk)
  ARRAY="$ARRAY"$(buildRam)
  ARRAY="$ARRAY"$(buildWeather)
  #ARRAY="$ARRAY"$(buildWorkLog)
  ARRAY="$ARRAY"$(buildCountDownsFromFiles)
  ARRAY="$ARRAY"$(buildStopwatchFromFiles)
  ARRAY="$ARRAY"$(buildTime)
  ARRAY="$ARRAY""]"
  export K3S_SEPARATOR=","
  echo "$ARRAY" | sed 's/\(.*\),/\1/'
}

configHeader
outputElement

while read line; do
  echo "$line" >>~/kai3status.stdin &
  # play -q -n synth 0.1 sin 880 || echo -e "\a"
done <"${1:-/dev/stdin}" &

while true; do
  sleep 5
  outputElement &
done

#sleep 2 && jobs -l

#echo M
#cfg_write "$CONFIGFILE" "key" "${array[@]}"
#echo R
#cfg_read "$CONFIGFILE" key