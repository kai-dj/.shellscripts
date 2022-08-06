function debug() {
 false && echo "$*" >> ~/.shellscripts/tmp/debug2.log
}

function buildCountDown() {
  debug "==============================="
  debug "buildCountDown"
  COUNTDOWN_FILE=$1
  FILE_CONTENT=$(cat "$COUNTDOWN_FILE")";"
  TIMESTAMP_FF=$(echo "$FILE_CONTENT"|cut -d';' -f1)
  DEFAULT_TIMESTAMP=$(date --iso-8601=seconds)
  TIMESTAMP=${TIMESTAMP_FF:-$DEFAULT_TIMESTAMP}
  COLORLIST_FF=$(echo "$FILE_CONTENT"|cut -d';' -f2)
  debug COLORLIST_FF "$COLORLIST_FF"
  DEFAULT_COLORLIST='14400:#ff0000,7200:#ff6600,0:#ffff00'
  COLORLIST=${COLORLIST_FF:-$DEFAULT_COLORLIST}
  debug COLORLIST "$COLORLIST"
  debug "=="
  COLORBLINK_FF=$(echo "$FILE_CONTENT"|cut -d';' -f3)
  DEFAULT_COLORBLINK="#00ff00:#00ff00"
  COLORBLINK=${COLORBLINK_FF:-$DEFAULT_COLORBLINK}
  debug COLORBLINK_FF "$COLORBLINK_FF"
  debug COLORBLINK "$COLORBLINK"


  BASENAME=$(basename "$COUNTDOWN_FILE")
  date -d "$TIMESTAMP" 2>/dev/null 1>/dev/null
  if [ $? -ne 0 ]; then
    return
  else
    COUNTDOWN_SECONDS=$(( (($(date -d "$TIMESTAMP" +%s) - $(date +%s)) / 5) * 5 ))
    (( (COUNTDOWN_SECONDS/10)*10 == COUNTDOWN_SECONDS )) && COUNTDOWN_COLOR=$(echo $COLORBLINK|cut -d':' -f1) || COUNTDOWN_COLOR=$(echo $COLORBLINK|cut -d':' -f2)
    IFS=', ' read -r -a COLORLIST_A <<< "$COLORLIST"
    for COLOR_PAIR in "${COLORLIST_A[@]}";  do
      debug "===COLOR_PAIR" "$COLOR_PAIR"
      TIMEFORCOLOR=$(echo "$COLOR_PAIR" | cut -d':' -f1)
      COLORFORTIME=$(echo "$COLOR_PAIR" | cut -d':' -f2)
      debug TIMEFORCOLOR "$TIMEFORCOLOR"
      debug COLORFORTIME "$COLORFORTIME"
      CDST="$COUNTDOWN_SECONDS" #$(( COUNTDOWN_SECONDS * -1 ))
      debug CDST "$CDST"
      #${COUNTDOWN_SECONDS#-}

#      echo ===============================
#      echo $COLORLIST_A
#      echo $CDST
#      echo $TIMEFORCOLOR
#      echo ===============================
#      echo
      if [[ "$CDST" -ge "$TIMEFORCOLOR" ]]; then
        COUNTDOWN_COLOR=$COLORFORTIME
        debug "--cdst GE tfc COUNTDOWN_COLOR=""$COLORFORTIME"
      fi
    done
#    if [ $COUNTDOWN_SECONDS -ge 14400 ]; then
#      COUNTDOWN_COLOR='#ff0000'
#    elif [ $COUNTDOWN_SECONDS -ge 7200 ]; then
#      COUNTDOWN_COLOR='#ff6600'
#    elif [ $COUNTDOWN_SECONDS -ge 0 ]; then
#      COUNTDOWN_COLOR='#ffff00'
#    else
#      (( (COUNTDOWN_SECONDS/10)*10 == COUNTDOWN_SECONDS )) && COUNTDOWN_COLOR='#00ff00' || COUNTDOWN_COLOR='#ffffff'
#    fi

    if [ $COUNTDOWN_SECONDS -ge 0 ]; then
      COUNTDOWN_SIGN='-'
      COUNTDOWN_SECONDS_PLUS=$((COUNTDOWN_SECONDS + 55))
    else
      COUNTDOWN_SECONDS=$(($(date +%s) - $(date +%s -d "$TIMESTAMP")))
      COUNTDOWN_SIGN='+'
      COUNTDOWN_SECONDS_PLUS=$((COUNTDOWN_SECONDS))
    fi
    #COUNTDOWN_FORMATTED=" ""$COUNTDOWN_SIGN""$(date -d@"$COUNTDOWN_SECONDS_PLUS" -u +%H:%M)"" "
    DAYS=$((COUNTDOWN_SECONDS_PLUS / 86400))
    HOURS=$(((COUNTDOWN_SECONDS_PLUS - (DAYS * 86400)) / 3600))
    MINUTES=$(((COUNTDOWN_SECONDS_PLUS - (HOURS * 3600) - (DAYS * 86400)) / 60))
    DISPLAY_HOURS=$(printf %02d $HOURS)
    display_minutes=$(printf %02d $MINUTES)
    if [ $DAYS -eq 0 ]; then
      COUNTDOWN_FORMATTED=" ""$COUNTDOWN_SIGN""$DISPLAY_HOURS"":""$display_minutes"" "
    else
      COUNTDOWN_FORMATTED=" ""$COUNTDOWN_SIGN""$DAYS""d:""$DISPLAY_HOURS"":""$display_minutes"" "
    fi
    COUNTDOWN_COLOR="#ffffff"
    echo '{ "full_text":"'"$BASENAME""$COUNTDOWN_FORMATTED"'", "color": "'"$COUNTDOWN_COLOR"'", "name": "'"countdown-""$BASENAME"'" }'","
    debug '{ "full_text":"'"$BASENAME""$COUNTDOWN_FORMATTED"'", "color": "'"$COUNTDOWN_COLOR"'", "name": "'"countdown-""$BASENAME"'" }'","
  fi
}

function buildCountDownsFromFiles() {
  COUNTDOWN_ARRAY=""
  for f in $(find ~/.shellscripts/countdown/files -type f); do
    COUNTDOWN_ARRAY="$COUNTDOWN_ARRAY"$(buildCountDown "$f")
  done
  echo "$COUNTDOWN_ARRAY"
}

function buildStopwatch() {

  STOPWATCH_FILE=$1
  TIMESTAMP=$(cat "$STOPWATCH_FILE")
  BASENAME=$(basename "$STOPWATCH_FILE")
  date -d "$TIMESTAMP" 2>/dev/null 1>/dev/null
  if [ $? -ne 0 ]; then
    return
  else
    STOPWATCH_SECONDS=$(($(date +%s) - $(date -d "$TIMESTAMP" +%s)))
#    if [ $STOPWATCH_SECONDS -ge 14400 ]; then
#      STOPWATCH_COLOR='#ff0000'
#    elif [ $STOPWATCH_SECONDS -ge 7200 ]; then
#      STOPWATCH_COLOR='#ff6600'
#    elif [ $STOPWATCH_SECONDS -ge 0 ]; then
#      STOPWATCH_COLOR='#ffff00'
#    else
#      STOPWATCH_COLOR='#00ff00'
#    fi

    if [ $STOPWATCH_SECONDS -ge 0 ]; then
      STOPWATCH_SIGN='-'
      #STOPWATCH_SECONDS_PLUS=$((STOPWATCH_SECONDS + 55))
      STOPWATCH_SECONDS_PLUS=$((STOPWATCH_SECONDS))
    else
      STOPWATCH_SECONDS=$(($(date +%s) - $(date +%s -d "$TIMESTAMP")))
      STOPWATCH_SIGN='+'
      STOPWATCH_SECONDS_PLUS=$((STOPWATCH_SECONDS))
    fi
    #STOPWATCH_FORMATTED=" ""$STOPWATCH_SIGN""$(date -d@"$STOPWATCH_SECONDS_PLUS" -u +%H:%M)"" "
    DAYS=$((STOPWATCH_SECONDS_PLUS / 86400))
    HOURS=$(((STOPWATCH_SECONDS_PLUS - (DAYS * 86400)) / 3600))
    MINUTES=$(((STOPWATCH_SECONDS_PLUS - (HOURS * 3600) - (DAYS * 86400)) / 60))
    SECONDS=$(((STOPWATCH_SECONDS_PLUS - (MINUTES * 60) - (HOURS * 3600) - (DAYS * 86400)) / 5 * 5))
    DISPLAY_HOURS=$(printf %02d $HOURS)
    display_minutes=$(printf %02d $MINUTES)
    display_SECONDS=$(printf %02d $SECONDS)
    STOPWATCH_SIGN=""
    if [ $DAYS -eq 0 ]; then
      STOPWATCH_FORMATTED=" ""$STOPWATCH_SIGN""$DISPLAY_HOURS"":""$display_minutes"":""$display_SECONDS"" "
    else
      STOPWATCH_FORMATTED=" ""$STOPWATCH_SIGN""$DAYS""d:""$DISPLAY_HOURS"":""$display_minutes"":""$display_SECONDS"" "
    fi
    echo '{ "full_text":"'"$BASENAME""$STOPWATCH_FORMATTED"'", "color": "'"$STOPWATCH_COLOR"'", "name": "'"STOPWATCH-""$BASENAME"'" }'","
  fi
}

function buildStopwatchFromFiles() {
  STOPWATCH_ARRAY=""

  for f in $(find /home/kai/.shellscripts/countdown/stopwatch/files -type f); do
    STOPWATCH_ARRAY="$STOPWATCH_ARRAY"$(buildStopwatch "$f")
  done
  echo "$STOPWATCH_ARRAY"
}


