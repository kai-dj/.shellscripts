#!/usr/bin/env sh
for loc in DCIM Pictures; do #Movies Music Pictures tra "Android/data/net.osmand/files/tracks"
  adb pull /storage/emulated/0/"$loc";
done
