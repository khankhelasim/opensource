# Lab 9: Systemd Timers for Task Scheduling

## 🎯 Objectives
- Understand systemd timers as an alternative to cron jobs  
- Create and manage systemd timer units  
- Configure complex scheduling with systemd timers  
- Monitor and troubleshoot timer execution  

---

## 🧰 Prerequisites
- Linux system with systemd (RHEL 8+, Fedora, or Ubuntu 20.04+)  
- Sudo/root privileges  
- Basic familiarity with systemd services  
- Text editor (vim/nano)

---

## ⚙️ Task 1: Create and Start a Systemd Timer for System Maintenance

### Step 1: Create a Service Unit
```bash
sudo nano /etc/systemd/system/maintenance.service
```
Step 2: Create a Timer Unit
```bash
sudo nano /etc/systemd/system/maintenance.timer
```

Add:
```bash
[Unit]
Description=Run maintenance daily

[Timer]
OnCalendar=daily
Persistent=true
Unit=maintenance.service

[Install]
WantedBy=timers.target
```
Step 3: Enable and Start the Timer
```bash
sudo systemctl daemon-reload
sudo systemctl enable --now maintenance.timer
systemctl status maintenance.timer
```

🧩 Expected Output:
The timer is active and will run daily.
After 24 hours, check:
```bash
sudo cat /var/log/maintenance.log
```
🧠 Task 2: Create a Complex Timer

Create backup.timer:
```bash
sudo nano /etc/systemd/system/backup.timer
```

Add:
```bash
[Unit]
Description=Weekly backup with specific time

[Timer]
OnCalendar=Mon *-*-* 02:00:00
Unit=backup.service
Persistent=true

[Install]
WantedBy=timers.target
```

Test your calendar expression:
```bash
systemd-analyze calendar "Mon *-*-* 02:00:00"
```
🔧 Task 3: Modify Timer Settings

To make the maintenance timer run hourly:
```bash
sudo nano /etc/systemd/system/maintenance.timer
```

Change:
```bash
OnCalendar=hourly
RandomizedDelaySec=5m
```

Reload and verify:
```bash
sudo systemctl daemon-reload
systemctl list-timers
```
🧩 Troubleshooting

Check logs: 
```bash
journalctl -u maintenance.service
```
Verify timer status: 
```bash
systemctl status maintenance.timer
```
Analyze schedule: 
```bash
systemd-analyze calendar hourly
```
If the timer doesn’t trigger:

Ensure it’s active: 
```bash
systemctl list-timers
```
Reload configs after edits

✅ Conclusion

You have:

Created and linked a systemd service with a timer

Configured daily and hourly schedules

Added randomized delay for balanced load

Verified and troubleshooted timer execution

Systemd timers are a powerful alternative to cron — offering logging, precise scheduling, and tighter integration with services.

🧹 Cleanup (Optional)
```bash
sudo systemctl stop maintenance.timer
sudo rm /etc/systemd/system/maintenance.{service,timer}
sudo systemctl daemon-reload
```
