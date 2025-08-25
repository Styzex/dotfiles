#!/bin/bash

sleep 5

echo "$(date): Starting script" >> /tmp/monitor-lid.log
cat /proc/acpi/button/lid/LID/state >> /tmp/monitor-lid.log

if grep -q "closed" /proc/acpi/button/lid/LID/state; then
  echo "$(date): Lid closed detected" >> /tmp/monitor-lid.log
  /usr/bin/hyprctl keyword monitor "HDMI-1,preferred,0x0,1" >> /tmp/monitor-lid.log 2>&1
  /usr/bin/hyprctl keyword monitor "eDP-1,disable" >> /tmp/monitor-lid.log 2>&1
else
  echo "$(date): Lid open detected" >> /tmp/monitor-lid.log
  /usr/bin/hyprctl keyword monitor "eDP-1,preferred,0x0,1" >> /tmp/monitor-lid.log 2>&1
fi

