#!/bin/bash
# Verify and list current cron jobs

echo "=== Current Cron Jobs ==="
crontab -l

echo "=== Cron Service Status ==="
systemctl status cron | grep Active

echo "=== Recent Cron Logs ==="
grep CRON /var/log/syslog | tail -n 10
