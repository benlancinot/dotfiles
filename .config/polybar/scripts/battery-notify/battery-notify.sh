#!/usr/bin/env bash

export DISPLAY="$(w -h $USER | awk '$3 ~ /:[0-9.]*/{print $3}')"
XAUTHORITY="$HOME/.Xauthority"

CRITICAL_LEVEL="${CRITICAL_LEVEL:-10}"
LOW_LEVEL="${LOW_LEVEL:-15}"
HIGH_LEVEL="${HIGH_LEVEL:-95}"

battery_level="$(acpi -b | grep -P -o '([0-9]+(?=%))')"

if [[ -r "$HOME/.dbus/Xdbus" ]]; then
    source "$HOME/.dbus/Xdbus"
fi

if acpi -b | grep -q "Discharging"; then
    if [[ "$battery_level" -le "$CRITICAL_LEVEL" ]]; then
        notify-send -i "battery-empty" -t 15000 -u critical "Battery Critical: ${battery_level}%"
    elif [[ "$battery_level" -le "$LOW_LEVEL" ]]; then
        notify-send -i "battery-caution" -t 15000 -u normal "Battery Low: ${battery_level}%"
    fi
elif [[ "$battery_level" -ge "$HIGH_LEVEL" ]]; then
    notify-send -i "battery-full-charging" -t 15000 -u normal "Battery Full: ${battery_level}%"
fi
