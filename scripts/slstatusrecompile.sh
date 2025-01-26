#!/bin/bash
PATH_SLSTATUS=/home/yarlama/.config/slstatus
PATH_CONFIG=$PATH_SLSTATUS/config.h

[ -e $PATH_CONFIG ] && rm -rf $PATH_CONFIG ; 
cd $PATH_SLSTATUS
make clean install 

