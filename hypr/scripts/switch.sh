#!/usr/bin/env bash

if grep open /proc/acpi/button/lid/LID0/state; then
   hyprctl keyword monitor "eDP-1, 2256x1504@60.00Hz, 0x0, 1.6"
else
    if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
        hyprctl keyword monitor "eDP-1, disable"
      else
        swaylock
    fi
fi
