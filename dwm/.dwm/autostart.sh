#!/bin/bash

process="xsettingsd dunst xfce4-power-manager"
for processed in $process; do
	if [ "$(pidof "$processed")" ]; then
		killall -q -9 "$processed"
	fi
done

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

# Power Management
xfce4-power-manager &

# Keyring daemon
dbus-update-activation-environment --all
/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh

#wallpapers
wall=$(find ~/.wallpapers/ -type f | shuf -n 1)
xwallpaper --stretch $wall &
cp -f $wall $HOME/.config/rofi/wall

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
xsettingsd 2>&1 | tee -a /tmp/xsettingsd.log &
dunst 2>&1 | tee -a /tmp/dunst.log &
nm-applet --indicator 2>&1 | tee -a /tmp/nm-applet.log &
blueman-applet 2>&1 | tee -a /tmp/blueman-applet.log &
nextcloud --background 2>&1 | tee -a /tmp/nextcloud.log &
xautolock -time 5 -locker slock 2>&1 | tee -a /tmp/lock.log &
