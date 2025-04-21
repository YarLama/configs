#!/bin/bash

color="#FFFFFF"
# ALSA
volume=$(amixer get Master | grep -o "[0-9]*%" | head -1 | tr -d '%')
muted=$(amixer get Master | grep -o "\[off\]" | head -1)

# PulseAudio:
# volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o "[0-9]*%" | head -1 | tr -d '%')
# muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o "Mute: yes")

if [[ "$muted" == "[off]" || "$muted" == "Mute: yes" ]]; then
    color="#FF0000"
    echo "<span color='$color'>🔇Muted</span>"
else
    if [ "$volume" -ge 70 ]; then
        icon="🔊"
    elif [ "$volume" -ge 1 ]; then
        icon="🔉"
    else
        color="#FF0000"
        icon="🔇"
    fi
    echo "<span color='$color'>$icon $volume%</span>"
fi

exit 0
