#!/bin/bash
# Lab 12 - Client setup for rsyslog log forwarding

LOG_SERVER_IP="192.168.1.100"

echo "[+] Installing rsyslog..."
sudo dnf install -y rsyslog || sudo apt-get install -y rsyslog

echo "[+] Configuring rsyslog client to forward logs..."
echo "*.* @@${LOG_SERVER_IP}:514" | sudo tee -a /etc/rsyslog.conf

echo "[+] Restarting rsyslog service..."
sudo systemctl restart rsyslog
sudo systemctl enable rsyslog

echo "[+] Sending test log message..."
logger "This is a test message from client"

echo "[+] Client setup complete! Check server logs at /var/log/remotehost/<client-hostname>/"
