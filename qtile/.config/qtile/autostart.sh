#!/bin/bash

# Load Xresources
xrdb "$HOME"/.Xresources

# Fix cursor
xsetroot -cursor_name left_ptr &

# Fix Java programs
export _JAVA_AWT_WM_NONREPARENTING=1

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

xrandr --output eDP-1 --auto --pos 0x0 --output DP-1 --auto --pos 0x-1080 &
setxkbmap -layout us,ru -option grp:caps_toggle &

xfce4-power-manager 2>&1 | tee -a /tmp/xfce4-power-manager.log &
nm-applet --indicator 2>&1 | tee -a /tmp/nm-applet.log &
dunst 2>&1 | tee -a /tmp/dunst.log &
nextcloud --background 2>&1 | tee -a /tmp/nextcloud.log &
