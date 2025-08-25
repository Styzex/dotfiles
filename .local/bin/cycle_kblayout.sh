#!/bin/bash

KB="company--usb-device--keyboard"
LAYOUT_COUNT=3
STATE_FILE="$HOME/.config/hypr/.layout_index"

# Read last index
if [[ -f "$STATE_FILE" ]]; then
  CURRENT_INDEX=$(<"$STATE_FILE")
else
  CURRENT_INDEX=0
fi

# Make sure it's a number
CURRENT_INDEX=$((CURRENT_INDEX + 0))

# Calculate next index
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % LAYOUT_COUNT ))

# Switch layout
hyprctl switchxkblayout "$KB" "$NEXT_INDEX"

# Save new index
echo "$NEXT_INDEX" > "$STATE_FILE"

