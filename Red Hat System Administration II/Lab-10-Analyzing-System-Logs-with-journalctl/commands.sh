
---

### ⚙️ commands.sh
```bash
#!/bin/bash
# Lab 10: Analyzing System Logs with journalctl

echo "=== Display All Logs ==="
journalctl

echo "=== Filter Logs by Time ==="
journalctl --since "1 hour ago"
journalctl --since "09:00:00" --until "10:00:00"

echo "=== Filter Logs by Unit ==="
journalctl -u sshd
journalctl -u sshd --since "today"

echo "=== Filter by Priority ==="
journalctl -p err
journalctl -p warning..emerg

echo "=== Filter by Boot Session ==="
journalctl --list-boots
journalctl -b
journalctl -b -1

echo "=== Follow Logs in Real Time ==="
journalctl -f

echo "=== JSON Output ==="
journalctl -u sshd --since "1 hour ago" -o json

echo "=== Disk Usage and Vacuum ==="
journalctl --disk-usage
sudo journalctl --vacuum-size=100M
