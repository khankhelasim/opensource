# Lab 14: File Transfer with scp and rsync

## 🎯 Objectives
- Securely transfer files over a network using **scp** (Secure Copy Protocol)
- Synchronize files between systems using **rsync**
- Understand the differences between `scp` and `rsync`

---

## 🧠 Prerequisites
- Two Linux systems (physical or virtual) with SSH access
- Basic familiarity with the command line
- SSH keys configured for password-less authentication (recommended)
- `scp` and `rsync` packages installed (usually pre-installed)

---

## ⚙️ Lab Setup
Ensure both systems have network connectivity.

1. Verify SSH service:
   ```bash
   sudo systemctl status sshd
    ```
Install packages if missing:
 ```bash
sudo apt-get install openssh-client openssh-server rsync -y   # Ubuntu/Debian
sudo yum install openssh-clients openssh-server rsync -y      # RHEL/CentOS
 ```
🧩 Task 1: Secure File Transfer with scp

1.1 Basic scp File Transfer

Objective: Copy a local file to a remote system
 ```bash
# Create a test file
echo "This is a test file" > local_file.txt
# Transfer to remote system
scp local_file.txt user_name@remote_ip:/home/user_name/
 ```
# Verify on remote system
 ```bash
ssh user_name@remote_ip "cat /home/user_name/local_file.txt"
 ```

Expected Output:

This is a test file


🔑 Key Concept:

scp uses SSH for secure transfer, encrypting both data and authentication.

1.2 Directory Transfer with scp

Objective: Copy an entire directory recursively
 ```bash
# Create local directory with files
mkdir local_dir
touch local_dir/file{1..3}.txt

# Transfer directory
scp -r local_dir user_name@remote_ip:/home/user_name/

# Verify transfer
ssh user_name@remote_ip "ls -l /home/user_name/local_dir"
 ```

💡 Tip: Use -C flag for compression if the connection is slow.

🧩 Task 2: File Synchronization with rsync

2.1 Basic rsync Local to Remote

Objective: Synchronize files efficiently using delta-transfer algorithm
 ```bash
# Modify a local file
echo "Updated content" >> local_dir/file1.txt

# Perform sync
rsync -avz local_dir/ user_name@remote_ip:/home/user_name/remote_dir/

# Verify on remote system
ssh user_name@remote_ip "ls -l /home/user_name/remote_dir"
 ```

🔑 Key Concept:
-a preserves permissions, -v gives verbose output, -z enables compression.

2.2 Incremental Backup with rsync

Objective: Maintain backup with only changed files
 ```bash
# Create local backup directory
mkdir backup

# First backup (full copy)
rsync -av --delete local_dir/ backup/

# Modify one file
echo "New line" >> local_dir/file2.txt

# Incremental backup
rsync -av --delete local_dir/ backup/
 ```

✅ Expected Behavior:

Only file2.txt gets updated in the backup directory.

🧩 Task 3: Secure rsync with SSH

3.1 rsync Over SSH

Objective: Encrypt rsync transfers with SSH
 ```bash
rsync -avz -e ssh local_dir/ user_name@remote_ip:/home/user_name/secure_backup/

# Verify on remote system
ssh user_name@remote_ip "ls -l /home/user_name/secure_backup"
 ```
3.2 Advanced rsync Options

Objective: Use advanced features for efficient transfers
 ```bash
# Partial transfer with checksum verification
rsync -avz --partial --progress -e ssh large_file.iso user_name@remote_ip:/home/user_name/backups/

# Bandwidth limiting (100KB/s)
rsync -avz --bwlimit=100 -e ssh local_dir/ user_name@remote_ip:/home/user_name/backups/
 ```

🔑 Key Concept:
--partial allows resuming interrupted transfers, and --progress shows live progress.

✅ Verification

To confirm successful completion:

Demonstrate file transfer using both scp and rsync

Show the difference when transferring modified files

Explain when to use scp vs. rsync

🧹 Cleanup
 ```bash
rm -rf local_file.txt local_dir backup
ssh user_name@remote_ip "rm -rf /home/user_name/{local_dir,remote_dir,secure_backup}"
 ```
