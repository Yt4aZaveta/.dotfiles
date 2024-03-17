#!/bin/bash
#░█▀▄▀█░▄▀▀▄░█▀▀▄░░▀░░▀█▀░▄▀▀▄░█▀▀▄░█▀▀
#░█░▀░█░█░░█░█░▒█░░█▀░░█░░█░░█░█▄▄▀░▀▀▄
#░▀░░▒▀░░▀▀░░▀░░▀░▀▀▀░░▀░░░▀▀░░▀░▀▀░▀▀▀
xrandr --output eDP --auto --pos 0x0 --output DisplayPort-0 --auto --pos 0x-1080 &

# For nemo
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty &

# Set keyboard layouts
setxkbmap -layout us,ru -option grp:caps_toggle &

while true; do
	xsetroot -name "$(date)"
	sleep 1s
done &
