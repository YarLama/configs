#!/bin/bash
capacity=$(cat /sys/class/power_supply/BATT/capacity)
status=$(cat /sys/class/power_supply/BATT/status)
color="#FFFFFF"

if [ "$status" = "Charging" ]; then
    echo "<span color='$color'>+🔋 $capacity%</span>"
else
    [ "$capacity" -lt 20 ] && color="#FF0000"
    [ "$capacity" -lt 60 ] && color="#FFFF10"
    echo "<span color='$color'>-🔋 $capacity%</span>"
fi
