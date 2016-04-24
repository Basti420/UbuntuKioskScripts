#!/bin/bash


USERNAME="infouser"	# Sollte eigentlich immer infouser sein
MAX_IDLE_TIME=6000	# In Millisekunden
BROWSER_NAME="chrome"

while true; do
  CURRENT_IDLE_TIME=$(export DISPLAY=:0 && sudo -u $USERNAME xprintidle)
  if(($MAX_IDLE_TIME < $CURRENT_IDLE_TIME)); then
    killall $BROWSER_NAME
  fi
done

