#!/bin/bash

uptime=$(uptime | awk -F ' ' '{print $3}')
echo "${uptime::-1}"
