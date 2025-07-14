#!/usr/bin/env bash

# Ensure environment is correct
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

WALL="$1"

# Check if file exists
if [ ! -f "$WALL" ]; then
  echo "🚫 Wallpaper not found: $WALL"
  exit 1
fi

# Set wallpaper via Hyprpaper
hyprctl hyprpaper wallpaper "HDMI-A-1,$WALL"
hyprctl hyprpaper wallpaper "eDP-1,$WALL"

# Wait for wallpaper to apply
# sleep 0.5

# Generate Matugen theme
# matugen image $WALL
~/.local/bin/matugen image "$WALL" >> /tmp/matugen.log 2>&1

