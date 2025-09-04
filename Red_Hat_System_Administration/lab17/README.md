# Lab 17: Monitoring System Performance and Resource Usage (Ubuntu Version)

## Objectives
By the end of this lab, you will be able to:
- Monitor CPU, memory, disk, and network usage using open-source tools.
- Analyze the impact of running processes on system resources.
- Detect and troubleshoot resource exhaustion scenarios.

---

## Prerequisites
- Ubuntu-based system (tested on Ubuntu 22.04)
- Basic familiarity with the command line
- Sudo or root access for installing packages
- Podman installed (for container-specific monitoring, optional)

---

## Tasks

### Task 1: Monitor CPU Usage
**Subtask 1.1: Check Overall CPU Usage**
```bash
top
Press q to exit

Observe the %CPU column for high-usage processes

Subtask 1.2: Get a Snapshot of CPU Usage

sudo apt install -y sysstat

mpstat -P ALL 1 5


Displays CPU usage per core

Task 2: Monitor Memory Usage

Subtask 2.1: Check Free Memory

free -h


Subtask 2.2: Identify Memory-Hungry Processes

top -o %MEM


Press q to exit

Task 3: Monitor Disk Usage

Subtask 3.1: Check Disk Space

df -h


Subtask 3.2: Check Directory-Level Disk Usage

du -sh /var/log/*


Subtask 3.3: Monitor Disk I/O

sudo apt install -y iotop

sudo iotop -o

Task 4: Monitor Network Usage

Subtask 4.1: Check Active Connections

ss -tulnp


Subtask 4.2: Monitor Real-Time Network Traffic

sudo apt install -y nload

nload


Press q to exit

Task 5: Analyze Running Processes Impact

Subtask 5.1: Use ps to Filter High-Resource Processes

ps aux --sort=-%cpu | head -n 5

ps aux --sort=-%mem | head -n 5


Subtask 5.2: Check Container Resource Usage (Podman)

podman stats

Task 6: Detect Resource Exhaustion

Subtask 6.1: Check System Logs

journalctl -p err -b


Subtask 6.2: Simulate High Load (Optional)

sudo apt install -y stress-ng

stress-ng --cpu 4 --vm 2 --timeout 30s


In another terminal, monitor with top or htop

Conclusion

In this lab, you learned how to:

Monitor CPU, memory, disk, and network usage

Analyze process-level resource consumption

Detect resource exhaustion using open-source tools
