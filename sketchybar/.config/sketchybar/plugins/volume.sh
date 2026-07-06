#!/bin/sh

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  if [ "$VOLUME" -eq 0 ]; then
    BAR=""
  elif [ "$VOLUME" -lt 13 ]; then
    BAR="▁"  
  elif [ "$VOLUME" -lt 25 ]; then
    BAR="▂"  
  elif [ "$VOLUME" -lt 38 ]; then
    BAR="▃"  
  elif [ "$VOLUME" -lt 50 ]; then
    BAR="▄"  
  elif [ "$VOLUME" -lt 63 ]; then
    BAR="▅"  
  elif [ "$VOLUME" -lt 75 ]; then
    BAR="▆"  
  elif [ "$VOLUME" -lt 88 ]; then
    BAR="▇"  
  else
    BAR="█"
  fi

  sketchybar --set "$NAME" \
    label="$BAR" \
    label.width=20
fi
