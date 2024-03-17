#!/bin/bash
#░█▀▄▀█░▄▀▀▄░█▀▀▄░░▀░░▀█▀░▄▀▀▄░█▀▀▄░█▀▀
#░█░▀░█░█░░█░█░▒█░░█▀░░█░░█░░█░█▄▄▀░▀▀▄
#░▀░░▒▀░░▀▀░░▀░░▀░▀▀▀░░▀░░░▀▀░░▀░▀▀░▀▀▀
#xrandr --output eDP --auto --pos 0x0 --output DisplayPort-0 --auto --pos 0x-1080 &
find ~/.wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &

# For nemo
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty &

# Set keyboard layouts
setxkbmap -layout us,ru -option grp:caps_toggle &

dunst &
