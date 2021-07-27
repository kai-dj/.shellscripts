PARAMETERS="--no-comb-detect --no-deinterlace --no-decomb --no-chroma-smooth --no-unsharp --no-lapsharp --no-deblock --no-grayscale --all-subtitles"
DISKNAME=$(lsblk -n -o LABEL /dev/sr0 | tr '[:upper:]' '[:lower:]' |xargs  | sed -e 's# #_#g')
TITLE=$1
##default 20
QUALITY=$2
echo "$DISKNAME""__""$TITLE"
read -r
sleep 3
HandBrakeCLI \
--input /dev/sr0 \
--title $TITLE \
--height 720 \
--format av_mp4 \
--no-markers \
--optimize \
--align-av \
--inline-parameter-sets \
--encoder x264 \
--encoder-preset medium \
--quality $QUALITY \
--rate 23.976 \
--cfr \
--audio "3,4" \
--output /home/aik/st/st_script_"$DISKNAME"_T"$TITLE"_Q"$QUALITY"_X264vs_720.mp4