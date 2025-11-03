# Lab 15: Tuning Kernel Parameters with sysctl

## 🎯 Objectives
By the end of this lab, you will be able to:
- View and modify kernel parameters using `sysctl`.
- Tune network and memory management settings for better performance.
- Persist kernel parameter changes across reboots.

## 🧩 Prerequisites
- Linux-based system (Ubuntu / RHEL / CentOS / Fedora)
- `sudo` privileges
- Basic command-line knowledge

---

## 🧠 Task 1: Viewing and Modifying Kernel Parameters with sysctl

### 🔹 Subtask 1.1: View Current Kernel Parameters

View all current kernel parameters:
```bash
sudo sysctl -a
```
View a specific parameter (example: vm.swappiness):
```bash
sudo sysctl vm.swappiness
```

Expected output:

vm.swappiness = 60

🔹 Subtask 1.2: Modify a Kernel Parameter Temporarily

Change vm.swappiness to 10:
```bash
sudo sysctl -w vm.swappiness=10
```

Verify:
```bash
sudo sysctl vm.swappiness
```

Explanation:

Lowering vm.swappiness reduces how aggressively the kernel swaps memory to disk.

⚙️ Task 2: Tuning Network and Memory Management Settings

🔹 Subtask 2.1: Optimize Network Performance

Increase the maximum number of pending connections:
```bash
sudo sysctl -w net.core.somaxconn=1024
```

Enable TCP Fast Open:
```bash
sudo sysctl -w net.ipv4.tcp_fastopen=3
```

Verify:
```bash
sudo sysctl net.core.somaxconn net.ipv4.tcp_fastopen
```
🔹 Subtask 2.2: Optimize Memory Management

Reduce swap usage tendency:
```bash
sudo sysctl -w vm.swappiness=10
```

Increase file descriptor limit:
```bash
sudo sysctl -w fs.file-max=2097152
```

Verify:
```bash
sudo sysctl vm.swappiness fs.file-max
```
💾 Task 3: Persisting Kernel Changes Across Reboots

🔹 Subtask 3.1: Configure Persistent Kernel Parameters

Edit /etc/sysctl.conf:
```bash
sudo nano /etc/sysctl.conf
```

Add:
```bash
vm.swappiness = 10
net.core.somaxconn = 1024
net.ipv4.tcp_fastopen = 3
fs.file-max = 2097152
```

Apply immediately:
```bash
sudo sysctl -p
```

✅ Alternative: Modular Config File
```bash
sudo nano /etc/sysctl.d/99-custom.conf
```

Add the same lines and apply:
```bash
sudo sysctl --system
```
🏁 Conclusion

You have successfully:

Viewed and modified kernel parameters with sysctl.

Tuned network and memory settings for performance.

Made kernel parameter changes persistent across reboots.
