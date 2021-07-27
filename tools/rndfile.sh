#!/bin/sh
# gets random file from directory
if [ $# -eq 0 ]
then
    # choose current dir when none supplied
    folder=$(pwd)
else
    folder=$(realpath "$1")
fi
# todo add recursive flag
echo $(find "$folder" -maxdepth 1 -type f | shuf -n 1)

