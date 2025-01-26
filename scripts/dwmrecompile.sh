#!/bin/bash
PATH_DWM=/home/yarlama/.config/dwm
PATH_DWM_CONFIG=$PATH_DWM/config.h

[ -e $PATH_DWM_CONFIG ] && rm -rf $PATH_DWM_CONFIG ; 
cd $PATH_DWM
make clean install && 
killall chrome

while pgrep -x "chrome" > /dev/null; do
    sleep 1
done

killall dwm 

