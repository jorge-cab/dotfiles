#!/bin/bash

# Get the active network interface
active_interface=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

# Check if the active interface is Ethernet or Wi-Fi
if [[ $active_interface =~ ^en ]]; then
  echo " Ethernet"
elif [[ $active_interface =~ ^wl ]]; then
  # Get the Wi-Fi SSID
  ssid=$(iwgetid -r)

  # Get the Wi-Fi signal strength
  signal_strength=$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) "%" }')

  echo "直 $ssid ($signal_strength)"
else
  echo "睊 Disconnected"
fi
