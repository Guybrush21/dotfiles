#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)
echo $MONITORS

polybar -c $HOME/.config/i3/polybar/config.ini main &

for m in $MONITORS; do
  echo "$m"
  if [ "$m" != "DP-4" ]; then
    echo $m
    MONITOR="$m" polybar -c $HOME/.config/i3/polybar/config.ini secondary &
  fi
done

echo "Bars launched..."
