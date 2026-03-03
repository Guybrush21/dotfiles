#!/bin/bash

# monitor=HDMI-A-1, preferred, auto-center-left,1 , transform, 3
# monitor=HDMI-A-2, preferred, auto-center-right,1 

SIDE_1="HDMI-A-1"
SIDE_2="HDMI-A-2"

if hyprctl monitors | grep -q "$SIDE_1"; 
then
  hyprctl keyword monitor "$SIDE_1,disable"
  hyprctl keyword monitor "$SIDE_2,disable"
  hyprctl keyword monitor "DP-3, 2560x1440@144, 0x0, 1"
else 
  hyprctl keyword monitor "HDMI-A-1,1920x1080@60,auto-center-left,1,transform,3"
  hyprctl keyword monitor "HDMI-A-2,1920x1080@60,auto-center-right,1 "
fi

