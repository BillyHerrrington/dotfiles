#!/usr/bin/bash


# Getting the data and initializing an array.
BATTERY_INFO=($( acpi | awk -F',' '{ print $0 }'))

# Formatting helpers
CHARGE=$((${BATTERY_INFO[3]//%,}))
ICON=""
FORMAT=""

# Battery icon to reflect on the bar.
if [[ "${BATTERY_INFO[2]}" == *"Charging"* ]] || [[ "${BATTERY_INFO[2]}" == *"Unknown"* ]] ; then
    ICON="  "
else
    ICON="   "
fi


# charging status with same background color
if [[ $CHARGE -lt 10 ]]; then
    FORMAT="%{B##1d1f21}%{B#1d1f21}  "
elif [[ $CHARGE -lt 30 ]]; then
    FORMAT="%{B#1d1f21}%{B#1d1f21}  "
elif [[ $CHARGE -lt 60 ]]; then
    FORMAT="%{B#1d1f21}%{B#1d1f21}  "
elif [[ $CHARGE -lt 100 ]]; then
    FORMAT="%{B#1d1f21}%{B#1d1f21}  "
fi

# Format charge & color depending on the status.
FORMAT="$CHARGE%"

# Display on bar
echo $FORMAT
