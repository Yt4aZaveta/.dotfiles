#!/bin/sh
if pgrep -x hypridle >/dev/null; then
	kill $(pgrep -x hypridle)
else
	hypridle &
	disown
fi

