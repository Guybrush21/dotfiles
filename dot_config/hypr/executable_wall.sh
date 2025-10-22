#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wall/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)
# Get the name of the focused monitor with hyprctl
FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

ALL_MONITORS=$(hyprctl monitors -j | jq -r '.[] | .name')

# Apply the selected wallpaper
for MONITOR in $ALL_MONITORS; do
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
  hyprctl hyprpaper reload "$MONITOR","$WALLPAPER"
done

