#!/bin/bash

# Fix cursor
xsetroot -cursor_name left_ptr

#GTK Theme
#export GTK_THEME='Catppuccin-Mocha-Standard-Mauve-dark:dark'

# Polkit agent (Gnome)
if [ ! "$(pidof polkit-gnome-authentication-agent-1)" ]; then
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

# Keyring daemon
dbus-update-activation-environment --all
/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh

#wallpapers
wall=$(find ~/.wallpapers/ -type f | shuf -n 1)
xwallpaper --stretch $wall &

xrandr --output eDP-1 --auto --pos 0x0 --output DP-1 --auto --pos 0x-1080
setxkbmap -layout us,ru -option grp:caps_toggle

nm-applet --indicator 2>&1 | tee -a /tmp/nm-applet.log &
#remmina -i 2>&1 | tee -a /tmp/remmina.log &
dunst 2>&1 | tee -a /tmp/dunst.log &
nextcloud --background 2>&1 | tee -a /tmp/nextcloud.log &
