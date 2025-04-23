#!/bin/bash

check_min=$(uptime | awk '{print $4}')
uptime=$(uptime | awk '{print $3}')
if [[ "${check_min}" == "min," ]]; then
  if [ ${uptime} -lt 10]; then
    echo "0:0${uptime}"
  else
    echo "0:${uptime}"
  fi
else
  echo "${uptime::-1}"
fi

