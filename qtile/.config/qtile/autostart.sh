#!/bin/bash

nm-applet &
xrandr --output eDP-1 --auto --pos 0x0 --output DP-1 --auto --pos 0x-1080 &
setxkbmap -layout us,ru -option grp:caps_toggle &
