#!/bin/sh
if pgrep -x hypridle >/dev/null; then
	printf '{"text":"󰛊"}'
else
	printf '{"text":"󰅶","class":"disabled"}'
fi

