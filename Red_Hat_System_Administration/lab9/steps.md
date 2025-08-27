# Lab 9 Steps: Managing Services with systemd

## Task 1: Check Service Status

### Step 1: List All Running Services

```bash
systemctl list-units --type=service --state=running

Expected Output:

A table showing all running services, their load state, active state, and description.

Step 2: Check Status of a Specific Service

systemctl status sshd


Expected Output:

Detailed status including whether the service is active, enabled, and recent log entries.

🔧 If sshd is not installed:

sudo dnf install openssh-server   # RHEL/Fedora/CentOS

sudo apt install openssh-server   # Ubuntu/Debian

Task 2: Start, Stop, and Restart Services

Step 1: Stop a Service

sudo systemctl stop sshd

systemctl status sshd


Expected Output: Active: inactive (dead)

Step 2: Start a Service

sudo systemctl start sshd

systemctl status sshd


Expected Output: Active: active (running)

Step 3: Restart a Service

sudo systemctl restart sshd

Task 3: Enable and Disable Services at Boot

Step 1: Enable a Service

sudo systemctl enable sshd


Expected Output: symlink created in multi-user.target.wants/.

Step 2: Disable a Service

sudo systemctl disable sshd


Expected Output: symlink removed.

Task 4: Inspect Unit Files

Step 1: View the Unit File

systemctl cat sshd

Step 2: Check Dependencies

systemctl list-dependencies sshd


Expected Output: A tree of services that sshd depends on.

Task 5: View Logs with journalctl

Step 1: View All Logs for a Service

sudo journalctl -u sshd

Step 2: Filter Logs by Time

sudo journalctl -u sshd --since "1 hour ago"

Step 3: Follow Logs in Real-Time

sudo journalctl -u sshd -f


Press Ctrl + C to exit.

🎯 Conclusion

In this lab, you learned how to:

Check, start, stop, and restart services using systemctl

Enable and disable services at boot

Inspect unit files and dependencies

View logs with journalctl

These skills are essential for managing services in production environments, especially in containerized and cloud-native applications.
