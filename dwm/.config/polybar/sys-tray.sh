#!/bin/sh

cache="$HOME/.config/polybar/tray.lock"
config="$HOME/.config/polybar/modules.ini"

# We kill stalonetray in order for it to reload the colors
if [ "$(pgrep stalonetray)" ]; then
	if [ ! -e "$cache" ]; then
		polybar-msg action "#tray.hook.1"
		# xdo hide -n stalonetray
		killall stalonetray
		touch "$cache"
		sed -i 's/tray\ninitial=.*/tray\ninitial=2/g' "$config"
	fi
else
	polybar-msg action "#tray.hook.0"
	rm "$cache"
	stalonetray -c "$HOME/.config/polybar/stalonetrayrc" &
	sed -i 's/tray\ninitial=.*/tray\ninitial=1/g' "$config"
fi
