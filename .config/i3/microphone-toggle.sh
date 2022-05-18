pactl set-source-mute 0 toggle 
pactl get-source-mute 0 | while read OUTPUT; do notify-send "$OUTPUT" -i "nothing"; done
