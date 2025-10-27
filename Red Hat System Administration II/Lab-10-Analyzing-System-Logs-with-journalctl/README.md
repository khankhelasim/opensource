# Lab 10: Analyzing System Logs with journalctl

## 🎯 Objectives
By the end of this lab, you will be able to:
- Query system logs using `journalctl` with time and unit filters.
- Filter logs by priority level and boot session.
- Use advanced `journalctl` options for detailed log analysis.

---

## 🧰 Prerequisites
- Linux system with `systemd` (Fedora, RHEL, CentOS, Ubuntu 16.04+)
- Sudo privileges
- Basic command-line knowledge

---

## 🧪 Task 1: Query Logs Using journalctl Based on Time and Unit

### 🔹 Subtask 1.1: Display All Logs
```bash
journalctl
```
🔹 Subtask 1.2: Filter Logs by Time
```bash
journalctl --since "1 hour ago"
journalctl --since "09:00:00" --until "10:00:00"
```

💡 Use --since and --until with absolute (YYYY-MM-DD HH:MM:SS) or relative times.

🔹 Subtask 1.3: Filter Logs by Unit
```bash
journalctl -u sshd
journalctl -u sshd --since "today"
```
🧪 Task 2: Filter Logs by Priority Level and Boot Session

🔹 Subtask 2.1: Filter by Priority Level
```bash
journalctl -p err
journalctl -p warning..emerg
```

Priority levels:
0: emerg | 1: alert | 2: crit | 3: err | 4: warning | 5: notice | 6: info | 7: debug

🔹 Subtask 2.2: Filter by Boot Session
```bash
journalctl --list-boots
journalctl -b
journalctl -b -1
```
🧪 Task 3: Advanced journalctl Options for Detailed Analysis

🔹 Subtask 3.1: Follow Logs in Real-Time
```bash
journalctl -f
```
🔹 Subtask 3.2: Output in JSON for Scripting
```bash
journalctl -u sshd --since "1 hour ago" -o json
```
🔹 Subtask 3.3: Show Disk Usage and Vacuum Old Logs
```bash
journalctl --disk-usage
sudo journalctl --vacuum-size=100M
```
🧩 Key Concepts

-u → Filter by unit

--since / --until → Time range

-p → Priority

-b → Boot session

-f → Follow logs

-o json → JSON output

🏁 Conclusion

You have learned to:

Query system logs efficiently with journalctl.

Filter logs by time, unit, and priority.

Manage log sizes and monitor real-time activity.
