#!/usr/bin/env bash

function highlight_base() {
  phrase=""
  paddingPattern="-"
  width="$(tput cols)"
  if [ "$#" -ge 1 ]; then
    phrase="$1"
  fi
  if [ "$#" -ge 2 ]; then
    paddingPattern="$2"
  fi
  padding=$(printf '%0.'${#paddingPattern}'s' "$paddingPattern"{1..500})
  #printf '%*.*s%s%*.*s\n' 0 "$(( (width - ${#phrase}) / 2 ))" "$padding" "$phrase" 0 "$(( ( ( width - ${#phrase} ) / 2 ) + ( ( width - ${#phrase} ) % 2) ))" "$padding"
  printf '%*.*s%s%*.*s\n' 0 "$(( (width - ${#phrase}) / 2 ))" "$padding" "$phrase" 0 "$(( ( ( width - ${#phrase} ) / 2 ) + ( ( width - ${#phrase} ) % 2) ))" "$padding"
}

function fillline() {
  pattern="-"
  if [ "$#" -ge 1 ]; then
    pattern="$1"
  fi

  highlight_base "" "$pattern"
}

function highlight() {
  paddingPattern="-"
  phrase=""
  widthPadding="$(tput cols)"
  if [ "$#" -ge 1 ]; then
    phrase=" ""$1"" "
  fi
  if [ "$#" -ge 2 ]; then
    paddingPattern="$2"
  fi
  highlight_base "$phrase" "$paddingPattern"
}

function waitKeypressBeep() {
  if [[ -f "$BACKUPNOWAITFILE" ]]; then
    echo "y"
    return
  fi
  if [ "$#" -ge 2 ]; then
    echo >&2 "$2"
  fi
  number_regex='^[0-9]+([.][0-9]+)?$'
  waitBetweenBeep="$1"
  if [[ -z $waitBetweenBeep ]] || ! [[ $waitBetweenBeep =~ $number_regex ]]; then
    waitBetweenBeep=60
  fi

  #if
  while true; do
    read -r -t "$waitBetweenBeep" -N 1 keypress < /dev/tty
    if [[ "$keypress" != "" ]]; then
      #      echo >&2 "keypress: ""$keypress"
      #      echo >&2
      break
    fi
    beep
  done
  echo "$keypress"
}

fillline "="
highlight "Starting tar DIRECTORIES in parent" "="
fillline "="
echo
for DIR in *; do
  if [[ -d "$DIR" ]]; then
    echo "...next to tar: ""$DIR"

    KEY_PRESSED=c #$(waitKeypressBeep 60 "-> press any key for start or Q for quit or O for omitting files")
    if [[ "$KEY_PRESSED" == "q" ]] || [[ $KEY_PRESSED == "Q" ]]; then
      echo >&2 "bye"
      exit 0
    elif [[ "$KEY_PRESSED" == "o" ]] || [[ $KEY_PRESSED == "O" ]]; then
      echo "...omitting dir"
    else
      echo "...tar dir"
      tar cfv "$DIR".tar "$DIR"
      fillline -
      highlight "done tar DIRECTORY - syncing..." -
      sync
      highlight "synced..." -
      highlight "deleting..." -
      rm -rf "$DIR"
      highlight "deleted..." -
#      KEY_PRESSED_DELETE=y #$(waitKeypressBeep 60 "-> delete DIR?")
#      if [[ "$KEY_PRESSED_DELETE" == "n" ]] || [[ $KEY_PRESSED == "N" ]]; then
#        rm -rf "$DIR"
#      fi
#      fillline -
    fi
  fi
done
