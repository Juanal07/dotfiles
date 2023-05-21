#!/bin/sh
# Run this script with root privileges
SCRIPT="$(cat ./wifi-on-off.sh)"

# Create or overwrite the script file with root privileges
echo "$SCRIPT" | sudo tee /etc/NetworkManager/dispatcher.d/disable-wifi-on-ethernet.sh >/dev/null

# Set correct permissions for the script file
sudo chmod +x /etc/NetworkManager/dispatcher.d/disable-wifi-on-ethernet.sh
sudo chown root:root /etc/NetworkManager/dispatcher.d/disable-wifi-on-ethernet.sh

echo "Script created or updated successfully."
