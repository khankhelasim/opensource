
---

### **2️⃣ Script File — `backup_home.sh`**
```bash
#!/bin/bash
# Backup home directory with date-based filename

# Ensure backups directory exists
mkdir -p ~/backups

# Create compressed backup with date
tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/

# Log the backup result
if [ $? -eq 0 ]; then
  echo "Backup completed successfully on $(date)" >> ~/backups/backup_log.txt
else
  echo "Backup FAILED on $(date)" >> ~/backups/backup_log.txt
fi
