
---

### 🧰 File 2: `backup_script.sh`
```bash
#!/bin/bash
# Lab 8: Backup Script for Scheduling with 'at'

# Create a log entry for start time
echo "Backup started at $(date)" >> ~/backups/backup_log.txt

# Create compressed backup of Documents directory
tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/Documents

# Create a log entry for completion time
echo "Backup completed at $(date)" >> ~/backups/backup_log.txt
