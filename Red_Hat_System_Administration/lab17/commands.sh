
---

### 📄 `commands.sh`
```bash
#!/bin/bash
# Lab 17: Monitoring System Performance and Resource Usage (Ubuntu)

set -e

echo "=== Installing required tools ==="
sudo apt update -y
sudo apt install -y sysstat iotop nload stress-ng podman

echo "=== Task 1: CPU Monitoring ==="
echo "Run 'top' to monitor live CPU usage, then exit with 'q'."
mpstat -P ALL 1 5

echo "=== Task 2: Memory Monitoring ==="
free -h
echo "Run 'top -o %MEM' to sort by memory usage."

echo "=== Task 3: Disk Monitoring ==="
df -h
du -sh /var/log/*
sudo iotop -o

echo "=== Task 4: Network Monitoring ==="
ss -tulnp
nload

echo "=== Task 5: Process Impact ==="
ps aux --sort=-%cpu | head -n 5
ps aux --sort=-%mem | head -n 5
podman stats || echo "Podman not running or no containers available."

echo "=== Task 6: Resource Exhaustion Simulation ==="
journalctl -p err -b
echo "Run stress-ng to simulate load:"
echo "  stress-ng --cpu 4 --vm 2 --timeout 30s"

