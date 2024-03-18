#!/bin/bash

# Policy Authentication Agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Keyring daemon
dbus-update-activation-environment --all
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

#wallpapers
find ~/.wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --stretch &

# gsettings
gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark-BL-LB'
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 10'
gsettings set org.gnome.desktop.interface icon-theme 'Tokyonight-Moon'
gsettings set org.gnome.desktop.interface cursor-theme 'Sweet-cursors'
gsettings set org.gnome.desktop.interface cursor-size 24

# For nemo
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty &

# Set keyboard layouts
setxkbmap -layout us,ru -option grp:caps_toggle &

#autostart stuff
dunst 2>&1 | tee -a /tmp/dunst.log &
nm-applet --indicator 2>&1 | tee -a /tmp/nm-applet.log &
blueman-applet 2>&1 | tee -a /tmp/blueman-applet.log &
nextcloud --background 2>&1 | tee -a /tmp/nextcloud.log &
xautolock -time 5 -locker slock 2>&1 | tee -a /tmp/lock.log &
