#!/bin/sh
sleep 5
IF="$1"
STATUS="$2"
dunstify "$IF" "$STATUS"

case "$IF" in
    en*)
        if [ "$STATUS" = "up" ]; then
            # Ethernet connection is up, disable Wi-Fi
            nmcli radio wifi off
            dunstify "Ethernet connection is up, disable Wi-Fi"
        else
            # Ethernet connection is down, enable Wi-Fi
            nmcli radio wifi on
            dunstify "Ethernet connection is down, enable Wi-Fi"
        fi
        ;;
esac

# #!/bin/bash
# echo test
# IF=$1
# STATUS=$2
# echo $IF $STATUS
#
# case $IF in
#     en*)
#         if [ "$STATUS" = "up" ]; then
#             # Ethernet connection is up, disable Wi-Fi
#             nmcli radio wifi off
#         else
#             # Ethernet connection is down, enable Wi-Fi
#             nmcli radio wifi on
#         fi
#         ;;
# esac
