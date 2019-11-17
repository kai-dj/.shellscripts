#!/bin/bash
# moves everything in home dir besides .dot-files and defined files to ~/tmp/<date>
if [[ $# -eq 0 ]] ; then
    BASEDIR="/run/media/aik/EXT_4TB/tmp"
else
    BASEDIR="$1"
fi
DIRNAME=$(date +%Y-%m-%d_%H%M)
mkdir "$BASEDIR""/""$DIRNAME"
echo "moving dirt from home to ""$BASEDIR""/""$DIRNAME"
shopt -s extglob
cd ~
mv -v !(.*|h6x|dwn|mnt|org|prj|tmp|WRM|README.org) "$BASEDIR""/""$DIRNAME""/"
