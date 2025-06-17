#!/bin/bash

output=""

# Check if Discord is running
if pgrep -x "discord" > /dev/null; then
    output+="ﭮ "    # Font Awesome Discord icon
fi

# Check if Spotify is running
if pgrep -x "spotify" > /dev/null; then
    output+=" "    # Font Awesome Spotify icon
fi

# Check if Telegram is running
if pgrep -x "telegram-desktop" > /dev/null; then
    output+=" "    # Devicons Telegram icon (or use another)
fi

# If no apps are running, show nothing
echo "$output"

