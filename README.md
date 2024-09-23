# Network Monitoring Scripts

This repository contains simple scripts to monitor network and service status on any Linux system.

## network_monitor.sh
This script checks your system’s IP address, active network connections, scans local devices, and verifies the status of SSH and VPN services.

### Dependencies
The script requires `nmap` for network scans and `speedtest-cli` for speed tests. Install them using the following commands:

```bash
sudo apt install nmap speedtest-cli
```

### Usage
```bash
curl -o network_monitor.sh https://raw.githubusercontent.com/10A0A/Universally-Compatible-Network-Monitoring-Script/main/network_monitor.sh
chmod +x network_monitor.sh
./network_monitor.sh

```
