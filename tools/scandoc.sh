#!/bin/sh
# script for batch scanning with brother-mfc250c (and probably others)

device=$(scanimage -L | cut -d'`' -f 2 | cut -d"'" -f 1)
while true
do
    echo "enter title or \"q\" for quit"
    read title
    echo "scanning ""$title""==========================="
    if [ "$title" == "q" ]
    then
        exit 0
    fi
     
    scanimage -d "$device" --format tiff --resolution 300 -x 220 -y 360 > "$title".tiff
    convert "$title".tiff "$title".pdf && rm "$title".tiff
    oldtitle="$title"
done

# Options specific to device `brother2:bus2;dev2':
#   Mode:
#     --mode Black & White|Gray[Error Diffusion]|True Gray|24bit Color [24bit Color]
#         Select the scan mode
#     --resolution 100|150|200|300|400|600|1200|2400|4800|9600dpi [200]
#         Sets the resolution of the scanned image.
#     --source FlatBed [FlatBed]
#         Selects the scan source (such as a document-feeder).
#     --brightness -50..50% (in steps of 1) [inactive]
#         Controls the brightness of the acquired image.
#     --contrast -50..50% (in steps of 1) [inactive]
#         Controls the contrast of the acquired image.
#   Geometry:
#     -l 0..215.9mm (in steps of 0.0999908) [0]
#         Top-left x position of scan area.
#     -t 0..355.6mm (in steps of 0.0999908) [0]
#         Top-left y position of scan area.
#     -x 0..215.9mm (in steps of 0.0999908) [215.88]
#         Width of scan-area.
#     -y 0..355.6mm (in steps of 0.0999908) [355.567]
#         Height of scan-area.

