#!/bin/bash

killall chrome

while pgrep -x "chrome" > /dev/null; do
    sleep 1
done

shutdown -r now
