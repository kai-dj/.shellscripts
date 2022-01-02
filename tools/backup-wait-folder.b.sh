#!/usr/bin/env bash
if [ "$#" -lt 2 ]; then
  exit 1
fi
SOURCE="$1"
TARGET="$2"
BACKUPNOWAITFILE=$(realpath ./backup_nowait)
if [ "$#" -ge 3 ]; then
  touch $BACKUPNOWAITFILE
else
  rm -f $BACKUPNOWAITFILE
fi

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

if [ ! -d "$SOURCE" ]; then
  echo >&2 "source is not a DIRECTORY"
  exit 1
fi
if [ ! -d "$TARGET" ]; then
  echo >&2 "target is not a DIRECTORY"
  exit 1
fi
SOURCE_REALPATH=$(realpath "$SOURCE")
TARGET_REALPATH=$(realpath "$TARGET")

fillline "="
highlight "Starting copy FILES in parent" "="
fillline "="
echo
KEY_PRESSED=$(waitKeypressBeep 60 "-> press any key for start or Q for quit or O for omitting files")
if [[ "$KEY_PRESSED" == "q" ]] || [[ $KEY_PRESSED == "Q" ]]; then
  echo >&2 "bye"
  rm $BACKUPNOWAITFILE
  exit 0
elif [[ "$KEY_PRESSED" == "o" ]] || [[ $KEY_PRESSED == "O" ]]; then
  echo "...omitting files"
else
  echo "...copy files"
  rsync -dt -h --info=progress2 --delete --size-only "$SOURCE_REALPATH""/" "$TARGET_REALPATH""/"
  fillline -
  highlight "done copying FILES" -
  fillline -
fi

echo
echo
fillline "="
highlight "Starting copy DIRECTORIES in parent" "="
fillline "="
echo

while IFS= read -r -d '' DIRECTORY; do
  DIRECTORY_REALPATH=$(realpath "$DIRECTORY")
  echo

  echo "...next to copy: ""$DIRECTORY_REALPATH"
  KEY_PRESSED=$(waitKeypressBeep 60 "-> press any key for next or q for quit or o for omitting next")
  if [[ "$KEY_PRESSED" == "q" ]] || [[ $KEY_PRESSED == "Q" ]]; then
    echo >&2 "bye"
    rm $BACKUPNOWAITFILE
    exit 0
  elif [[ "$KEY_PRESSED" == "o" ]] || [[ $KEY_PRESSED == "O" ]]; then
    echo
    echo "...omitting directory ""$DIRECTORY_REALPATH"
  else
    rsync -ahv --inplace --info=progress2 --delete --size-only "$DIRECTORY_REALPATH" "$TARGET_REALPATH""/"
    echo
    fillline -
    highlight "done copying ""$DIRECTORY" -
    fillline -
  fi

done < <(find "$SOURCE_REALPATH" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)
beep -f 400 -r 3 -l 100 -D 100 -n -f 200 -l 400
echo "sync"
sync
echo "done bye"
