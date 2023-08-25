#!/usr/bin/env bash

FILE=$1



WINDOW=$(swaymsg -t get_tree | \
    jq -r '..
        | select(.pid? and .visible?)
        | "\(.rect.x+.current_border_width),\(.rect.y+.current_border_width) \(.rect.width-(.current_border_width*2))x\(.rect.height-(.current_border_width*2))"
    ' | slurp)

wf-recorder -g "$WINDOW" -f $FILE


#ffmpeg \
#  -ss 00:00:00.000 \
#  -i $FILE \
#  -vf "fps=10,scale=1024:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
#  -loop 1 \
#  ${FILE}.gif

echo "done: $FILE"

