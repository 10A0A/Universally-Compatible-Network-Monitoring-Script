#!/bin/bash

echo "Network and System Monitor"
echo "--------------------------"

# IP Address of the system
echo "IP Address:"
hostname -I || echo "Hostname command not found."

# Active network connections
echo ""
echo "Active Network Connections:"
if command -v ss &> /dev/null
then
    ss -tuln
else
    echo "'ss' not installed, please install it with 'sudo apt install iproute2'"
fi

# Local network scan (optional, requires 'nmap')
echo ""
echo "Scanning local network for active devices (requires nmap)..."
if command -v nmap &> /dev/null
then
    nmap -sn 192.168.0.0/24
else
    echo "'nmap' not found, you can install it with 'sudo apt install nmap'"
fi

# Internet speed test (optional, requires 'speedtest-cli')
echo ""
echo "Running Speedtest (requires speedtest-cli)..."
if command -v speedtest-cli &> /dev/null
then
    speedtest-cli --simple
else
    echo "'speedtest-cli' not found, install it with 'sudo apt install speedtest-cli'"
fi

# SSH service status
echo ""
echo "Checking SSH service status:"
if systemctl list-units --type=service | grep -q ssh
then
    systemctl is-active ssh
else
    echo "'SSH' service not found."
fi

# OpenVPN status (optional, if installed)
echo ""
echo "Checking OpenVPN service status (if available):"
if systemctl list-units --type=service | grep -q openvpn
then
    systemctl is-active openvpn
else
    echo "'OpenVPN' service not found."
fi
