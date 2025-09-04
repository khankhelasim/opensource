# Lab 11: Step-by-Step Guide

## Task 1: Exploring /var/log Files
```bash
ls -l /var/log

sudo cat /var/log/messages

sudo cat /var/log/secure

messages: System-wide log messages

secure (or auth.log on Ubuntu): Authentication logs

Task 2: Using journalctl Filters

sudo journalctl

sudo journalctl --since "2023-01-01" --until "2023-01-02"

sudo journalctl -u sshd

sudo journalctl -f   # follow logs live

Task 3: Understanding logrotate

ls /etc/logrotate.d/

cat /etc/logrotate.conf

sudo nano /etc/logrotate.d/mylogs


Add config:

/var/log/mylog.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}


Test:

sudo logrotate -d /etc/logrotate.d/mylogs

Task 4: Searching Logs with grep and awk

sudo grep "error" /var/log/messages

sudo grep -i "fail" /var/log/secure

sudo grep -c "authentication failure" /var/log/secure

sudo awk '/Failed password/ {print $1, $2, $3, $9, $11}' /var/log/secure

podman logs <container_id> | grep -i error
