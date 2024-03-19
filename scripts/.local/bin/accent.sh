#!/bin/sh

config="$HOME/.config/rofi/colors.rasi"

pallete="#89b4fa #b4befe #74c7ec #89dceb #94e2d5 #a6e3a1 #f9e2af #fab387 #eba0ac #f38ba8 #cba6f7 #f5c2e7 #f2cdcd #f5e0dc"

length=$(echo "$pallete" | wc -w)
index=$(awk -v n="$length" 'BEGIN {srand (); print int (1+rand ()*n)}')
color=$(echo "$pallete" | cut -d " " -f "$index")

sed -i "s/accent: .*;/accent: $color;/g" "$config"
