#!/usr/bin/env sh
HOSTNAME=$(cat /etc/hostname)
PARTSDIR=~/.shellscripts/i3wm/buildConfig
TARGETCONFIG=~/.config/i3/config

function findConfPartForHost() {
  F_PREFIX=$1
  CONFPARTFILE=$(find $PARTSDIR -iname "$F_PREFIX""-""$HOSTNAME")
  if [ -z $CONFPARTFILE ]; then
    CONFPARTFILE=$(find $PARTSDIR -iname "$F_PREFIX""-default")
  fi
  echo "$CONFPARTFILE"
}
PREFIXLIST=(
  "001-header"
  "002-autostart"
  "003-keyboard"
  "004-font"
  "005-workspace"
  "006-bindsym"
  "007-modes"
  "008-bar"
  "009-colors"
)
echo > $TARGETCONFIG
for PREFIX in "${PREFIXLIST[@]}"; do
  echo $PREFIX
  cat $(findConfPartForHost $PREFIX) >> $TARGETCONFIG;
  echo >>$TARGETCONFIG
  echo >>$TARGETCONFIG
done
