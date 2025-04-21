#!/bin/bash

layout=$(xset -q | grep -A 0 'LED mask' | awk '{print $NF}')
if [[ "$layout" == "00000000" || "$layout" == "00000001" ]]; then
    echo "EN"
else
    echo "RU" 
fi
