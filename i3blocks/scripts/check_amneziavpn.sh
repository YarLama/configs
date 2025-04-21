#!/bin/bash

color="#FFFF00"

if ip link show amn0 >/dev/null 2>&1; then
    echo "<span color='$color'>🔑</span>" 
else
    echo ""
fi
