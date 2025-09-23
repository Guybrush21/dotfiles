#!/bin/sh

# while true; do

# Terminate already running bar instances
killall -q polybar

 Wait until the processes have been shut down
 while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#
 # Launch bar1 and bar2
 MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)
 echo $MONITORS
#
# polybar -c $HOME/.config/i3/polybar/config.ini main &

# sleep 3; 

# done
#
for m in $MONITORS; do
   MONITOR="$m" polybar -c $HOME/.config/i3/polybar/config.ini main &
done

echo "Bars launched..."
