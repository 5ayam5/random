#!/bin/bash
xdg-open "$(locate -i / | rofi -threads 0 -width 100 -dmenu -i -p "Find" -theme ~/.config/polybar/forest/scripts/rofi/launcher.rasi)"
