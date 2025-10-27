# Lab 7: Setting Up Cron Jobs

## 🎯 Objectives
By the end of this lab, you will be able to:
- Automate repetitive tasks using cron jobs  
- Understand and use cron expressions for flexible scheduling  
- Edit the crontab file and manage existing cron jobs  

---

## 🧠 Prerequisites
Before starting, ensure you have:
- A Linux-based machine (provided by Al Nafi—click *Start Lab* to begin)
- Basic familiarity with the Linux command line  
- Permission to execute scripts and edit system files (sudo access may be required)

---

## ⚙️ Lab Setup
> Al Nafi provides pre-configured Linux cloud machines.  
> Click **Start Lab** to launch your environment — no additional setup needed.

---

## 🧩 Task 1: Create a Cron Job for Automatic Backups

### 🔹 Step 1: Create a Backup Script
Create a directory for backups:
Create the backup script:

nano ~/backups/backup_home.sh


Add the following:

#!/bin/bash
tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/
echo "Backup completed on $(date)" >> ~/backups/backup_log.txt


Make it executable:

chmod +x ~/backups/backup_home.sh


✅ Expected Outcome:

Script created at ~/backups/backup_home.sh

File is executable

Backup can be run manually to verify it works

🔹 Step 2: Schedule the Backup with Cron

Edit your crontab:

crontab -e


Add this line to run the backup every day at 2 AM:

0 2 * * * ~/backups/backup_home.sh


Verify:

crontab -l


✅ Expected Outcome:

Cron job runs automatically every day at 2:00 AM

Backups appear in ~/backups/

A log entry is appended in backup_log.txt

🧰 Troubleshooting

“Permission denied” → Ensure script is executable:

chmod +x ~/backups/backup_home.sh


To view cron logs:

grep CRON /var/log/syslog

🧩 Task 2: Use Cron Expressions for Different Scheduling
🔹 Step 1: Understand Cron Syntax
Field	Meaning	Range
1	Minute	0–59
2	Hour	0–23
3	Day of Month	1–31
4	Month	1–12
5	Day of Week	0–6 (Sun=0)


🔹 Step 2: Schedule Multiple Jobs

Edit crontab:

crontab -e


Add the following examples:

Every minute:

* * * * * echo "Test cron job" >> ~/cron_test.log


Every Monday at 5 PM:

0 17 * * 1 echo "Weekly reminder" >> ~/weekly_log.txt


Every 10 minutes:

*/10 * * * * date >> ~/time_log.txt


✅ Expected Outcome:

cron_test.log updates every minute

weekly_log.txt updates every Monday at 5 PM

time_log.txt updates every 10 minutes

🧩 Task 3: Edit and List Existing Cron Jobs
🔹 Step 1: List Current Jobs
crontab -l

🔹 Step 2: Remove or Edit Jobs

To remove all jobs:

crontab -r


To edit jobs:

crontab -e


✅ Expected Outcome:
You can view, add, edit, or delete cron jobs easily.

🧠 Key Concept Recap
Expression	Meaning
0 2 * * *	Run daily at 2 AM
*/10 * * * *	Run every 10 minutes
0 17 * * 1	Run every Monday at 5 PM
* * * * *	Run every minute
🏁 Conclusion

In this lab, you:

Automated backups using a shell script and cron

Learned how to read and write cron expressions

Managed and verified cron jobs

💡 Why It Matters:

Cron jobs are a core part of Linux automation.
They help you save time, reduce manual effort, and ensure tasks like backups and log rotation run consistently.
```bash
mkdir ~/backups
