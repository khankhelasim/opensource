
---

### ⚙️ **File 2 — lab3_command_substitution.sh**

```bash
#!/bin/bash
# ===============================================
# Lab 3: Command Substitution
# ===============================================

echo "===== Setup ====="
mkdir -p command_substitution_lab
cd command_substitution_lab || exit
touch file1.txt file2.log data.csv config.ini backup.tar.gz
echo "Files created:"
ls
echo

# ===== Task 1: Basic Command Substitution =====
echo "===== Task 1: Basic Command Substitution ====="
echo "Today is $(date)"
echo "There are $(ls | wc -l) files in this directory"
echo "Today is `date`"
echo "Test 1: $(echo $(date))"
echo "Test 2: `echo \`date\``"
echo

# ===== Task 2: Dynamic File Operations =====
echo "===== Task 2: Dynamic File Operations ====="
echo "Displaying contents of .txt files:"
cat $(find . -name "*.txt") 2>/dev/null
echo
echo "Counting lines in .log files:"
wc -l $(find . -name "*.log") 2>/dev/null
echo
echo "Creating backup of configuration files..."
tar czf config_backup_$(date +%Y%m%d).tar.gz $(find . -name "*.ini")
echo "Backup created successfully!"
echo
echo "Checking disk usage for files larger than 1MB:"
du -h $(find . -size +1M) 2>/dev/null || echo "No files larger than 1MB found."
echo

# ===== Task 3: Building Command Pipelines =====
echo "===== Task 3: Building Command Pipelines ====="
echo "There are $(ps aux | wc -l) processes running"
echo "Largest file in directory:"
ls -S | head -n 1
echo "Newest file modified at:"
echo "Newest file was modified at $(date -r $(ls -t | head -n 1))"
echo "The largest file is $(du -h $(find . -type f) | sort -h | tail -n 1)"
echo

echo "===== Lab 3 Completed Successfully! ====="
