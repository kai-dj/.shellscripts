#!/usr/bin/env bash
# moves everything in home dir besides .dot-files and defined files to ~/tmp/<date>
shopt -s extglob
cd ~
if [[ $# -eq 0 ]] ; then
    BASEDIR="/run/media/aik/EXT_4TB_2/tmp"
else
    BASEDIR="$1"
fi
DIRNAME=$(date +%Y-%m-%d_%H%M)
echo "making directory ""$BASEDIR""/""$DIRNAME"
mkdir "$BASEDIR""/""$DIRNAME"
echo "making directory ""$BASEDIR""/""$DIRNAME""/""dwn"
mkdir "$BASEDIR""/""$DIRNAME""/""dwn"
sleep 1
echo "moving dirt from dwn to ""$BASEDIR""/""$DIRNAME""/""dwn"
for dwncontent in ~/dwn/*;
do
mv -v "$dwncontent" "$BASEDIR""/""$DIRNAME""/""dwn""/"
done
sleep 1
echo "moving dirt from home to ""$BASEDIR""/""$DIRNAME"
for homecontent in !(.*|bin|h6x|mnt|org|prj|tmp|WRM|README.org)
do
mv -v "$homecontent" "$BASEDIR""/""$DIRNAME""/"
done
