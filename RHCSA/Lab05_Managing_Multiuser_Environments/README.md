# 🧪 Lab 5: Managing Multiuser Environments

## 🎯 Objectives
By the end of this lab, you will be able to:
- Understand and practice user management in Linux systems
- Switch between users using `su` and `sudo`
- Configure and manage file permissions
- Work with multiuser targets (graphical/text mode)
- Gain practical experience with user isolation and privilege management

---

## 🧩 Prerequisites
- Linux system (preferably RHEL/CentOS/Fedora)
- Root or sudo privileges
- Basic command-line knowledge
- Podman installed for container-related tasks

### Setup Requirements
Create at least 2 non-root users:
```bash
sudo useradd user1
sudo useradd user2
sudo passwd user1
sudo passwd user2
```
## 🧱 Task 1: Log in as different users using su and sudo
### 🔹 Subtask 1.1: Switch users with su
```bash
su - user1
whoami          # Expected: user1
exit            # Return to original user
```
### 🔹 Subtask 1.2: Execute commands with sudo
```bash
cat /etc/shadow        # Expected: Permission denied
sudo cat /etc/shadow   # Expected: File contents if sudo allowed
sudo -l                # List sudo privileges
```

Tip: If your user is not in the sudoers file:
```bash
sudo usermod -aG sudo yourusername
```
## 🧮 Task 2: Switch between users and understand permissions
### 🔹 Subtask 2.1: Create and test file access

As user1:
```bash
su - user1
touch ~/user1_file.txt
echo "This is user1's file" > ~/user1_file.txt
```

As user2:
```bash
su - user2
cat /home/user1/user1_file.txt   # Expected: Permission denied
ls -l /home/user1/user1_file.txt
```
### 🔹 Subtask 2.2: Modify file permissions

As user1:
```bash
su - user1
chmod 644 ~/user1_file.txt
```

As user2:
```bash
su - user2
cat /home/user1/user1_file.txt   # Expected: Now readable
```

Key Concept: Linux permissions (read=4, write=2, execute=1) control access for owner, group, and others.

## 📦 Task 3: Configure multiuser targets
### 🔹 Subtask 3.1: Check current target
```bash
systemctl get-default
```

Common outputs:
```bash
graphical.target → GUI mode
multi-user.target → text mode
```
### 🔹 Subtask 3.2: Change between targets

Switch to text mode:
```bash
sudo systemctl isolate multi-user.target
```

Switch back to GUI mode:
```bash
sudo systemctl isolate graphical.target
```

Set default target persistently:
```bash
sudo systemctl set-default multi-user.target
```

Tip: If GUI fails, start your display manager:
```bash
sudo systemctl start gdm   # or lightdm depending on system
```
🧪 Advanced Task: Container User Management with Podman

Run container as a specific user:
```bash
podman run --user 1000 -it fedora /bin/bash
whoami    # Expected: user with UID 1000
exit
```
🏁 Conclusion

You have learned to:

Switch between users and use sudo for privileged commands

Manage file permissions between users

Control system targets (text vs GUI mode)

Understand user isolation in containers with Podman

These skills are essential for Linux administration and OpenShift container security.

🧹 Cleanup

Remove test users:
```bash
sudo userdel -r user1
sudo userdel -r user2
```

Reset default target if changed:
```bash
sudo systemctl set-default graphical.target
```
