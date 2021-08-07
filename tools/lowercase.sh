#!/usr/bin/env sh
# renames file to lowercase (could harm files - be careful)


for file in "$@"
do
    folder=$(dirname "$(realpath "$file")")
    filename=$(basename "$file")
    lowerfilename=$( echo "$filename" | tr [:upper:] [:lower:])
    mv -v "$folder""/""$filename" "$folder""/""$lowerfilename"
done
