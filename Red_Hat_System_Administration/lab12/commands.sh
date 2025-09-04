
---

#### 3. `commands.sh`
```bash
#!/bin/bash
# Lab 12: Configuring Network Interfaces

# Setup
sudo systemctl start NetworkManager

# Task 1: List devices
nmcli device status
nmcli device show

# Task 2: Configure static IP
nmcli connection show
sudo nmcli connection modify "Wired connection 1" \
ipv4.addresses 192.168.1.100/24 \
ipv4.gateway 192.168.1.1 \
ipv4.dns "8.8.8.8,8.8.4.4" \
ipv4.method manual
sudo nmcli connection up "Wired connection 1"

# Task 3: Modify connection profile
nmcli connection show "Wired connection 1"
sudo nmcli connection modify "Wired connection 1" 802-3-ethernet.mtu 1500
sudo nmcli connection modify "Wired connection 1" ipv6.method disabled

# Task 4: Restart NetworkManager
sudo systemctl restart NetworkManager
systemctl status NetworkManager

# Task 5: Hostname and DNS
sudo hostnamectl set-hostname mylabhost
hostnamectl
sudo nmcli connection modify "Wired connection 1" ipv4.dns "1.1.1.1 1.0.0.1"
sudo nmcli connection modify "Wired connection 1" ipv4.ignore-auto-dns yes

# Verification
ip addr show
ping -c 4 8.8.8.8
nslookup google.com || dig google.com

