# Lab 12: Using rsyslog for Centralized Logging

## 🎯 Objectives
By the end of this lab, you will be able to:
- Install and configure `rsyslog` on both client and server systems  
- Set up log forwarding from a client to a central log server  
- Analyze centralized logs using `journalctl` and `rsyslog` tools  

---

## 🧰 Prerequisites
- Two Linux systems (physical or virtual)
- OS: CentOS/RHEL 8+ or Ubuntu 20.04+
- Network connectivity between systems
- Sudo/root privileges
- Basic Linux command-line knowledge

**Lab Setup:**

| Role | Hostname | IP Address |

|------|-----------|-------------|

| Server | logserver.example.com | 192.168.1.100 |

| Client | client.example.com | 192.168.1.101 |

---

## 🧩 Task 1: Install and Configure rsyslog

### Step 1.1 — Install rsyslog (on both systems)
```bash
# For RHEL/CentOS
sudo dnf install -y rsyslog

# For Ubuntu/Debian
sudo apt-get update && sudo apt-get install -y rsyslog
```
✅ Rsyslog should be installed without errors.

Step 1.2 — Configure rsyslog Server

Edit the main configuration file:
```bash
sudo vi /etc/rsyslog.conf
```

Uncomment or add the following lines:
```bash
module(load="imudp")
input(type="imudp" port="514")

module(load="imtcp")
input(type="imtcp" port="514")

$template RemoteLogs,"/var/log/remotehost/%HOST-NAME%/%PROGRAMNAME%.log"
*.* ?RemoteLogs
& ~
```

Create the remote log directory:
```bash
sudo mkdir -p /var/log/remotehost
```

Restart and enable rsyslog:
```bash
sudo systemctl restart rsyslog
sudo systemctl enable rsyslog
```

Open firewall ports:
```bash
# RHEL/CentOS
sudo firewall-cmd --add-port=514/tcp --permanent
sudo firewall-cmd --add-port=514/udp --permanent
sudo firewall-cmd --reload

# Ubuntu
sudo ufw allow 514/tcp
sudo ufw allow 514/udp
```

✅ Server is now listening on TCP/UDP port 514.

🧩 Task 2: Configure Client to Forward Logs

Step 2.1 — Edit Client rsyslog Config
```bash
sudo vi /etc/rsyslog.conf
```

Add at the end of the file:
```bash
*.* @@192.168.1.100:514  # TCP forwarding
```
# OR
```bash
# *.* @192.168.1.100:514  # UDP forwarding
```

Restart rsyslog:
```bash
sudo systemctl restart rsyslog
```

✅ Client will begin forwarding logs to the central server.

Step 2.2 — Test Log Forwarding

On client:
```bash
logger "This is a test message from client"
```

On server:
```bash
sudo tail -f /var/log/remotehost/client.example.com/logger.log
```

✅ You should see the test message appear on the server.

🧩 Task 3: Analyze Centralized Logs

Step 3.1 — Using journalctl
```bash
journalctl -f
```

Shows live view of system journal, including forwarded logs.

Step 3.2 — Using rsyslog Log Files
```
# View logs from specific client
sudo ls /var/log/remotehost/client.example.com/

# Search for errors
sudo grep "error" /var/log/remotehost/client.example.com/*.log
```

✅ You can now view organized logs by hostname and program.

⚙️ Optional Advanced Configuration

Forward Specific Logs Only
```bash
authpriv.* @@192.168.1.100:514
*.error @@192.168.1.100:514
```
Enable Encrypted Log Transfer (TLS)
```bash
sudo dnf install -y rsyslog-gnutls    # or apt-get equivalent
```

Then configure TLS parameters in /etc/rsyslog.conf.

🧩 Troubleshooting

Issue	Check

Logs not appearing on server	telnet 192.168.1.100 514

Check rsyslog status	sudo systemctl status rsyslog

Check rsyslog own logs	sudo tail -f /var/log/messages or /var/log/syslog

SELinux issues	Temporarily test with sudo setenforce 0

Permissions	Ensure /var/log/remotehost has correct ownership

🏁 Conclusion

✅ You have successfully:

Set up centralized logging using rsyslog

Configured client-server log forwarding

Verified and analyzed collected logs
