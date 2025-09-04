
---

#### 3. `commands.sh`
```bash
#!/bin/bash
# Lab 11: Analyzing and Storing Logs

# Task 1: Explore /var/log
ls -l /var/log
sudo cat /var/log/messages
sudo cat /var/log/secure || sudo cat /var/log/auth.log

# Task 2: journalctl filters
sudo journalctl
sudo journalctl --since "2023-01-01" --until "2023-01-02"
sudo journalctl -u sshd
sudo journalctl -f

# Task 3: logrotate
ls /etc/logrotate.d/
cat /etc/logrotate.conf
sudo tee /etc/logrotate.d/mylogs <<EOF
/var/log/mylog.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
EOF
sudo logrotate -d /etc/logrotate.d/mylogs

# Task 4: Searching logs
sudo grep "error" /var/log/messages
sudo grep -i "fail" /var/log/secure || sudo grep -i "fail" /var/log/auth.log
sudo grep -c "authentication failure" /var/log/secure || sudo grep -c "authentication failure" /var/log/auth.log
sudo awk '/Failed password/ {print $1, $2, $3, $9, $11}' /var/log/secure || true

