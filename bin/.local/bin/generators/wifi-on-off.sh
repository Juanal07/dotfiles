#!/bin/sh
sleep 5
IF=$1
STATUS=$2
if echo "$IF" | grep -q "^en"; then
    if [ "$STATUS" = "up" ]; then
        # Ethernet connection is up, disable Wi-Fi
        nmcli radio wifi off
    else
        # Ethernet connection is down, enable Wi-Fi
        nmcli radio wifi on
    fi
else
    # No Ethernet connection, enable Wi-Fi
    nmcli radio wifi on
fi
