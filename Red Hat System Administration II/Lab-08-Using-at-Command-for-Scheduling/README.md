# Lab 8: Using at Command for Scheduling

## 🎯 Objectives
By the end of this lab, you will be able to:
- Understand the purpose and functionality of the `at` command.
- Schedule one-time tasks for future execution.
- Manage scheduled jobs using `atq` and `atrm`.
- Create and automate a backup task using `at`.

---

## 🧰 Prerequisites
- Linux system (Fedora/RHEL/CentOS recommended)
- Terminal access with `sudo` privileges
- `at` package installed  
  *(Install with:)*  
  ```bash
  sudo dnf install at -y

Basic command line familiarity

⚙️ Setup Requirements

Ensure the atd service is running:
 ```bash
sudo systemctl enable --now atd

Verify the installation:
 ```bash
at -V

🧩 Task 1: Scheduling a One-Time Backup Task

🪣 Subtask 1.1: Create a Simple Backup Script

Create a backup directory:
 ```bash
mkdir ~/backups

Create the backup script:
 ```bash
nano ~/backup_script.sh

Add the following content:
 ```bash
#!/bin/bash

echo "Backup started at $(date)" >> ~/backups/backup_log.txt

tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/Documents

echo "Backup completed at $(date)" >> ~/backups/backup_log.txt

Make it executable:
 ```bash
chmod +x ~/backup_script.sh

✅ Expected Outcome:

A functional backup script that compresses the ~/Documents folder and logs start/end times.

⏰ Subtask 1.2: Schedule the Backup with at

Schedule it to run in 5 minutes:
 ```bash
at now + 5 minutes -f ~/backup_script.sh

Press Ctrl + D to confirm.

Verify scheduled job:
 ```bash
atq

✅ Expected Output:

A job entry showing the job ID and the scheduled time.

🕒 Subtask 1.3: Alternative Time Formats

Try different time formats:
 ```bash
at 11:30 PM tomorrow -f ~/backup_script.sh
 ```bash
at 9:00 AM next week -f ~/backup_script.sh
 ```bash
at now + 1 hour -f ~/backup_script.sh

🧭 Task 2: Managing Scheduled Tasks
📋 Subtask 2.1: List Scheduled Jobs

View all pending jobs:
 ```bash
atq

🗑️ Subtask 2.2: Remove a Scheduled Job

Remove a specific job using its job ID:
 ```bash
atrm <job_id>

🔍 Subtask 2.3: View Job Details (Optional)

View job files inside the system queue:
 ```bash
sudo ls /var/spool/at
 ```bash
sudo cat /var/spool/at/<job_file>

🏁 Conclusion

In this lab, you:

Automated a one-time backup task using at.

Explored time-based scheduling formats.

Learned to view, cancel, and troubleshoot scheduled tasks.

🧠 Why it matters:
at is ideal for one-time automations such as maintenance tasks, system reboots, and data backups — saving you from having to remember manual executions.
