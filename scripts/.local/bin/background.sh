#!/bin/bash

directory=/home/yt4a/Pictures/Backgrounds

if [ -d "$directory" ]; then
	random_background=$(ls $directory/*.jpg | shuf -n 1)

	hyprctl hyprpaper unload all
	hyprctl hyprpaper preload $random_background
	hyprctl hyprpaper wallpaper ",$random_background"

fi
