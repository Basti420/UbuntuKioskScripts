#!/bin/bash
# Benötigt das Paket xprintidle

USERNAME="infouser"	# Sollte eigentlich immer infouser sein
MAX_IDLE_TIME=6000	# In Millisekunden
BROWSER_NAME="chrome"	# chrome,firefox,iceweasel

LAST_IDLE_TIME=0	

while true; do
  CURRENT_IDLE_TIME=$(export DISPLAY=:0 && sudo -u $USERNAME xprintidle)
  if(($MAX_IDLE_TIME < $CURRENT_IDLE_TIME)); then
    killall $BROWSER_NAME
  fi
done

