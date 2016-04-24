#!/bin/bash
# Benötigt das Paket xprintidle

USERNAME="lys3rg"	# Sollte eigentlich immer infouser sein
MAX_IDLE_TIME=6000	# In Millisekunden
BROWSER_NAME="chrome"	# chrome,firefox,iceweasel

LAST_IDLE_TIME=100000	

while true; do
  CURRENT_IDLE_TIME=$(export DISPLAY=:0 && sudo -u $USERNAME xprintidle)
  if(($MAX_IDLE_TIME <= $CURRENT_IDLE_TIME)); then
    if(($LAST_IDLE_TIME >= $CURRENT_IDLE_TIME)); then
      #killall $BROWSER_NAME
      echo "Killed Browser $BROWSER_NAME"
      echo "$LAST_IDLE_TIME"
      LAST_IDLE_TIME=$CURRENT_IDLE_TIME
      echo "$LAST_IDLE_TIME"
    fi
  fi
done

