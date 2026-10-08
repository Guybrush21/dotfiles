#!/bin/sh
# For each display, changes the wallpaper to a randomly chosen image in
# a given directory at a set interval.
. "$(dirname "$(readlink -f "$0")")/config.sh"

if [ $# -lt 1 ] || [ ! -d "$1" ]; then
	printf "Usage:\n\t\e[1m%s\e[0m \e[4mDIRECTORY\e[0m\n" "$0"
	printf "\tChanges the wallpaper with awww to a randomly chosen image in DIRECTORY\n"
	exit 1
fi

img=$( find "$1" -type f | shuf -n 1) 


for d in $(awww query | awk '{print $2}' | sed s/://); do 
	awww img --outputs "$d" "$img" 
done


