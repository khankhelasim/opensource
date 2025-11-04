# 🧪 Lab 18: Using setenforce and semanage for SELinux

## 🎯 Objectives
By the end of this lab, you will be able to:

- Understand and switch between SELinux modes using `setenforce`.
- Create and manage SELinux policies using `semanage`.
- Troubleshoot SELinux denials and adjust policies for system security.

---

## 🧰 Prerequisites
- A Linux system with SELinux enabled (RHEL/CentOS/Fedora recommended)
- Root or sudo privileges
- Basic familiarity with Linux command line

---

## ⚙️ Task 1: Switching SELinux Modes Using `setenforce`

### 🔹 Subtask 1.1: Check Current SELinux Status

Run the following command to verify SELinux status:

```bash
sestatus
```
Expected Output:
```bash
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
```

Alternatively, check mode directly:
```bash
getenforce
```

Expected Output:
```bash
Enforcing
```
🔹 Subtask 1.2: Temporarily Change SELinux Mode

Switch to Permissive mode (logs violations but does not block actions):
```bash
sudo setenforce 0
```

Verify:
```bash
getenforce
```

Expected Output:
```bash
Permissive
```

Switch back to Enforcing mode:
```bash
sudo setenforce 1
```
Verify again:
```bash
getenforce
```

Expected Output:
```bash
Enforcing
```

📝 Note: Changes with setenforce are temporary and revert after reboot.

🔹 Subtask 1.3: Permanently Change SELinux Mode

To make SELinux mode persistent across reboots:

Open the configuration file:
```bash
sudo vi /etc/selinux/config
```

Modify this line:

SELINUX=permissive


(or SELINUX=enforcing to revert)

Save and exit, then reboot:
```bash
sudo reboot
```
🛠️ Task 2: Managing SELinux Policies with semanage

🔹 Subtask 2.1: Install Required Package

Ensure semanage is available:
```bash
sudo dnf install policycoreutils-python-utils -y
```
🔹 Subtask 2.2: List SELinux Port Contexts

View current SELinux port assignments:
```bash
sudo semanage port -l
```

Expected Output:
```bash
SELinux Port Type              Proto    Port Number
http_port_t                    tcp      80, 443, 8080
```
🔹 Subtask 2.3: Add a Custom Port to SELinux Policy

If your application uses a non-standard port (e.g., 8081 for HTTP):
```bash
sudo semanage port -a -t http_port_t -p tcp 8081
```

Verify it was added:
```bash
sudo semanage port -l | grep 8081
```

Expected Output:
```bash
http_port_t                    tcp      8081
```
🔹 Subtask 2.4: Remove a Custom Port

Remove the custom port from policy:
```bash
sudo semanage port -d -t http_port_t -p tcp 8081
```
🧩 Task 3: Troubleshooting SELinux Denials

🔹 Subtask 3.1: Check SELinux Denials in Logs

Check for access denials:
```bash
sudo ausearch -m avc -ts recent
```

Or manually inspect logs:
```bash
sudo grep "avc: denied" /var/log/audit/audit.log
```
🔹 Subtask 3.2: Generate and Apply a Custom Policy Module

If a service is being denied access, create a custom module:
```bash
sudo grep "avc: denied" /var/log/audit/audit.log | audit2allow -M mypolicy
```

Apply the policy module:
```bash
sudo semodule -i mypolicy.pp
```
🔹 Subtask 3.3: Temporarily Allow Access (Debugging)

If you’re unsure about policy changes, switch to Permissive mode:
```bash
sudo setenforce 0
```

Test your application, then revert:
```bash
sudo setenforce 1
```
🏁 Conclusion

In this lab, you learned how to:

Switch between Enforcing and Permissive modes using setenforce

Manage SELinux policies using semanage

Troubleshoot and resolve SELinux denials using logs and policy modules

By mastering these tools, you can balance security and functionality effectively on SELinux-enabled systems.
