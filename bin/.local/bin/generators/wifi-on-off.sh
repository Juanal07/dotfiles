#!/bin/sh
# Run this script with root privileges

# Script contents
SCRIPT="#!/bin/sh
sleep 2
IF=\$1
STATUS=\$2

case \"\$IF\" in
    en*)
        if [ \"\$STATUS\" = \"up\" ]; then
            # Ethernet connection is up, disable Wi-Fi
            nmcli radio wifi off
        else
            # Ethernet connection is down, enable Wi-Fi
            nmcli radio wifi on
        fi
        ;;
esac
"

# Create or overwrite the script file with root privileges
echo "$SCRIPT" | sudo tee /etc/NetworkManager/dispatcher.d/disable-wifi-on-ethernet.sh >/dev/null

# Set correct permissions for the script file
sudo chmod +x /etc/NetworkManager/dispatcher.d/disable-wifi-on-ethernet.sh

echo "Script created or updated successfully."
