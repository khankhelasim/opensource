
---

#### 2️⃣ **server_config.sh**
```bash
#!/bin/bash
# Lab 12 - Server setup for centralized logging

echo "[+] Installing rsyslog..."
sudo dnf install -y rsyslog || sudo apt-get install -y rsyslog

echo "[+] Configuring rsyslog for UDP and TCP..."
sudo sed -i '/imudp/s/^#//g' /etc/rsyslog.conf
sudo sed -i '/imtcp/s/^#//g' /etc/rsyslog.conf

cat <<EOF | sudo tee -a /etc/rsyslog.conf

module(load="imudp")
input(type="imudp" port="514")

module(load="imtcp")
input(type="imtcp" port="514")

$template RemoteLogs,"/var/log/remotehost/%HOST-NAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
& ~
EOF

echo "[+] Creating log directory..."
sudo mkdir -p /var/log/remotehost

echo "[+] Restarting rsyslog..."
sudo systemctl restart rsyslog
sudo systemctl enable rsyslog

echo "[+] Opening firewall ports..."
if command -v firewall-cmd &> /dev/null; then
    sudo firewall-cmd --add-port=514/tcp --permanent
    sudo firewall-cmd --add-port=514/udp --permanent
    sudo firewall-cmd --reload
else
    sudo ufw allow 514/tcp
    sudo ufw allow 514/udp
fi

echo "[+] Rsyslog server is ready on port 514!"
