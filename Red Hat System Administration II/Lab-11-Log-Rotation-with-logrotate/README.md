# Lab 11: Log Rotation with logrotate

## 🎯 Objectives

- Configure log rotation for system logs to prevent disk space exhaustion.

- Implement and test custom log rotation policies.

- Verify log rotation functionality using manual execution.

---

## 🧰 Prerequisites

- Linux system (RHEL/CentOS 8+, Fedora, or Ubuntu)

- Root or sudo privileges

- `logrotate` package installed

Install and verify:
```bash
sudo dnf install logrotate -y     # RHEL/CentOS/Fedora
sudo apt install logrotate -y     # Ubuntu/Debian
logrotate --version
```
⚙️ Task 1: Edit logrotate.conf for Custom Settings

Step 1.1: Examine Default Configuration
```bash
sudo cat /etc/logrotate.conf
ls /etc/logrotate.d/
```

You’ll see the global settings (like weekly, rotate 4, etc.) and other service configurations.

Step 1.2: Create Custom Configuration

Create a new file:
```bash
sudo vim /etc/logrotate.d/mycustomlogs
```

Add the configuration below:
```bash
/var/log/syslog {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0640 root adm
    postrotate
        /usr/bin/systemctl restart rsyslog >/dev/null 2>&1 || true
    endscript
}
```
Key Parameters Explained

Parameter	        Description

daily	            Rotate logs every day

rotate 7	        Keep 7 old log files

compress	        Compress older logs

delaycompress	    Compress files after next rotation

missingok	        Ignore missing logs

notifempty	      Skip empty files

create	          Create new log with permissions

postrotate	      Restart rsyslog after rotation

Check syntax:
```bash
sudo logrotate --debug /etc/logrotate.d/mycustomlogs
```
🔁 Task 2: Force Log Rotation Using logrotate

Step 2.1: Manual Rotation (Dry Run)
```bash
sudo logrotate --debug --verbose --force /etc/logrotate.d/mycustomlogs
```
Step 2.2: Actual Rotation
```bash
sudo logrotate --force /etc/logrotate.d/mycustomlogs
```

Verify rotated files:
```bash
ls -lh /var/log/syslog*
```

Expected:
```bash
/var/log/syslog
/var/log/syslog.1.gz
/var/log/syslog.2.gz
```
🧾 Task 3: Test and Check Log Rotation Effects

Step 3.1: Simulate Log Growth
```bash
for i in {1..1000}; do echo "Test log entry $i" | sudo tee -a /var/log/syslog; done
du -sh /var/log/syslog
```
Step 3.2: Trigger Rotation and Verify
```bash
sudo logrotate --force /etc/logrotate.d/mycustomlogs
ls -lh /var/log/syslog*
file /var/log/syslog.1.gz
```

Output should show:
```bash
gzip compressed data
```
✅ Conclusion

Achievements

Configured custom log rotation using logrotate.

Performed and verified manual log rotation.

Confirmed gzip compression and log recreation.

Key Takeaways

logrotate prevents disk exhaustion by managing log sizes.

Custom configs allow fine-tuning per application.

Manual verification ensures smooth automation before cron execution.

📂 Files in This Lab

File                  	Description

mycustomlogs	          Custom logrotate configuration file

README.md	              Step-by-step lab guide
