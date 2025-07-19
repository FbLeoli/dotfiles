# #!/usr/bin/env bash
# 
# # Ensure environment is correct
# export DISPLAY=:0
# export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
# 
# WALL="$1"
# 
# # Check if file exists
# if [ ! -f "$WALL" ]; then
#   echo "🚫 Wallpaper not found: $WALL"
#   exit 1
# fi
# 
# # Set wallpaper via Hyprpaper
# hyprctl hyprpaper wallpaper "HDMI-A-1,$WALL"
# hyprctl hyprpaper wallpaper "eDP-1,$WALL"
# 
# # Wait for wallpaper to apply
# # sleep 0.5
# 


#!/bin/bash

DIR="$HOME/dotfiles/wallpapers/"
SELECTED=$(ls "$DIR" | wofi --dmenu --width 500 --height 300 --prompt "Choose wallpaper")

if [ -n "$SELECTED" ]; then
    swww img "$DIR/$SELECTED" --transition-type wipe --transition-fps 60 --transition-duration 2
fi
# Generate Matugen theme
# matugen image $WALL
~/.local/bin/matugen image "$DIR/$SELECTED" >> /tmp/matugen.log 2>&1
