#!/usr/bin/bash

export PATH=$PATH:/sbin:/usr/sbin
INTERFACE=wlp2s0
color="#FFFFFF"
text=""

if [! -d "/sys/class/net/$INTERFACE" ]; then
    color="#FF0000"
    text="No interface"
    echo "<span color='$color'>$tetx</span>"
    exit 0
fi

if [! -d "/sys/class/net/$INTERFACE/operstate" != "up" ]; then
    color="#FF0000"
    text="Interface down"
    echo "<span color='$color'>$tetx</span>"
    exit 0
fi

SSID=$(iwconfig "$INTERFACE" 2> /dev/null | grep -oP 'ESSID:"\K[^"]+')
SIGNAL=$(iwconfig "$INTERFACE" 2> /dev/null | grep -oP 'Signal level=\K[0-9-]+')

if [ -z "$SSID"]; then
  color="#FF0000"
  text="Disconnected"
else
  text="  $SSID"
fi

echo "<span color='$color'>$text</span>"
