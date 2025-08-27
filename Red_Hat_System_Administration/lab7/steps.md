
---

### 📄 steps.md
```markdown
# Lab 7: Controlling File Permissions and Ownership

## Lab Setup
```bash

mkdir ~/permissions_lab

cd ~/permissions_lab

Task 1: Viewing File Permissions

1.1 Create sample files

touch file1.txt

mkdir dir1

ls -l


Expected output:

-rw-r--r-- 1 user user 0 Jan 1 10:00 file1.txt

drwxr-xr-x 2 user user 4096 Jan 1 10:00 dir1

1.2 View hidden files

ls -la

Task 2: Modifying Permissions

2.1 Using chmod (symbolic mode)

chmod u+x file1.txt

ls -l file1.txt

chmod g-r file1.txt

chmod u=rwx,g=rx,o= file1.txt

2.2 Using chmod (numeric mode)

chmod 755 file1.txt

chmod 600 file1.txt

Task 3: Managing Ownership

3.1 Using chown

sudo chown root file1.txt

ls -l file1.txt

sudo chown user:users file1.txt

3.2 Using chgrp

sudo chgrp wheel file1.txt

Task 4: Special Permission Bits

4.1 SUID

which passwd

ls -l /usr/bin/passwd

sudo chmod u+s /usr/bin/passwd

4.2 SGID

mkdir shared_dir

sudo chmod g+s shared_dir

4.3 Sticky Bit

sudo chmod +t /tmp

ls -ld /tmp

Task 5: SELinux Contexts

5.1 Viewing Contexts

sudo dnf install -y policycoreutils-python-utils

ls -Z file1.txt

5.2 Modifying Contexts

sudo chcon -t httpd_sys_content_t file1.txt

sudo restorecon -v file1.txt

Cleanup

rm -rf ~/permissions_lab

