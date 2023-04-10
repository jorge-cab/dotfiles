#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Get monitor names using xrandr
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Launch Polybar for each monitor
for m in $MONITORS; do
    MONITOR=$m polybar --reload mybar &
done

echo "Polybar launched..."

