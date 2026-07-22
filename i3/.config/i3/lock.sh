#!/bin/bash
i3lock --nofork
# Re-apply display config after unlock
xrandr --output DP-1 --primary --auto --output eDP-1 --off
