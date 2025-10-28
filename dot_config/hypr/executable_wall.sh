#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wall/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)
FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

ALL_MONITORS=$(hyprctl monitors -j | jq -r '.[] | .name')

for MONITOR in $ALL_MONITORS; do
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
  hyprctl hyprpaper reload "$MONITOR","$WALLPAPER"
done

