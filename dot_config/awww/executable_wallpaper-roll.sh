#!/bin/sh
# For each display, changes the wallpaper to a randomly chosen image in
# a given directory at a set interval.
. "$(dirname "$(readlink -f "$0")")/config.sh"

if [ $# -lt 1 ] || [ ! -d "$1" ]; then
	printf "Usage:\n\t\e[1m%s\e[0m \e[4mDIRECTORY\e[0m [\e[4mINTERVAL\e[0m]\n" "$0"
	printf "\tChanges the wallpaper to a randomly chosen image in DIRECTORY every\n\tINTERVAL seconds (or every %d seconds if unspecified)." "$DEFAULT_INTERVAL"
	exit 1
fi

# Only one instance per user: stop a roller left over from a previous
# session, together with its pipeline subshells.
pidfile="${XDG_RUNTIME_DIR:-/tmp}/wallpaper-roll.pid"
old=$(cat "$pidfile" 2>/dev/null)
if [ -n "$old" ] && [ "$old" != $$ ] && grep -qs wallpaper-roll "/proc/$old/cmdline"; then
	kids=$(pgrep -P "$old")
	kill "$old" $kids 2>/dev/null
fi
echo $$ > "$pidfile"

# Give awww-daemon a moment when it is started together with this script
i=0
until awww query >/dev/null 2>&1; do
	i=$((i + 1))
	[ "$i" -gt 50 ] && exit 1
	sleep 0.2
done

# Stop once the daemon is gone, i.e. when the session has ended
while awww query >/dev/null 2>&1; do
	find "$1" -type f \
	| while read -r img; do
		echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
	done \
	| sort -n | cut -d':' -f2- \
	| while read -r img; do
		outputs=$(awww query 2>/dev/null) || exit
		for d in $(echo "$outputs" | awk '{print $2}' | sed s/://); do # see awww-query(1)
			# Get next random image for this display, or re-shuffle images
			# and pick again if no more unused images are remaining
			[ -z "$img" ] && if read -r img; then true; else break 2; fi
			awww img --resize "$RESIZE" --outputs "$d" "$img" 

			unset -v img # Each image should only be used once per loop
		done
		sleep "${2:-$DEFAULT_INTERVAL}"
	done
done
