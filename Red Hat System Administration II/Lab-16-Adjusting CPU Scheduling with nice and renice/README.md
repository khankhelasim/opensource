# Lab 16: Adjusting CPU Scheduling with nice and renice

## 🎯 Objectives
By the end of this lab, you will be able to:
- Understand Linux process priority and scheduling.
- Set process priority using `nice`.
- Modify running process priority using `renice`.
- Monitor CPU usage changes based on priority levels.

---

## 🧩 Prerequisites
- Linux system (RHEL, CentOS, Fedora, or Ubuntu)
- Basic terminal knowledge
- Root/sudo privileges
- `htop` or `top` installed for monitoring

---

## ⚙️ Setup
Update your system and install monitoring tools:
```bash
sudo dnf update -y
sudo dnf install htop -y
```
🧠 Task 1: Setting Process Priority with nice

🔹 1.1 Understanding Nice Values

Linux priority range: -20 (highest) to 19 (lowest)

Default value: 0

Lower nice value = higher priority = gets more CPU time

🔹 1.2 Launch a Test Process

Run a CPU-intensive process:
```bash
dd if=/dev/zero of=/dev/null &
```

This continuously writes zeros to /dev/null, consuming CPU.

🔹 1.3 Check Current Priority
```bash
ps -l -p $(pgrep -n dd)
```

Expected Output:

Look for the NI (Nice) column → should be 0 (default).

🔹 1.4 Start a Process with Custom Priority
```bash
nice -n 10 dd if=/dev/zero of=/dev/null &
```

This runs dd with a nice value of 10, meaning it has lower priority.

🔹 1.5 Verify Priority
```bash
ps -l -p $(pgrep -n dd)
```

Expected: NI = 10

⚙️ Task 2: Adjusting Priority with renice

🔹 2.1 Identify Running Process
```bash
pgrep -l dd
```

Take note of the PID (process ID).

🔹 2.2 Change Priority of a Running Process
```bash
sudo renice -n 15 -p <PID>
```

Replace <PID> with the actual process ID.

This makes the process run at an even lower priority.

🔹 2.3 Verify Change
```bash
ps -l -p <PID>
```

Expected: NI = 15

🔹 2.4 Increase Priority (Requires Root)
```bash
sudo renice -n -5 -p <PID>
```

This sets a higher priority (negative nice value).

Note: Only root can assign negative nice values.

📊 Task 3: Monitoring CPU Usage Effects

🔹 3.1 Launch Monitoring Tool
```bash
htop
```

Press F6 to sort by CPU% or NI.

Observe how different priorities affect CPU usage.

🔹 3.2 Observe Priority Effects

Processes with lower nice (e.g., -5) get more CPU time.

Processes with higher nice (e.g., 19) get less CPU time.

🔹 3.3 Create CPU Competition

Run multiple processes with different priorities:
```bash
nice -n 19 dd if=/dev/zero of=/dev/null &
nice -n -5 dd if=/dev/zero of=/dev/null &
```

Observe in htop:

The -5 process will consume more CPU than the 19 one.

🧰 Troubleshooting Tips

If renice fails:

Check if PID exists:
```bash
ps -p <PID>
```

Ensure you have sudo privileges.

If CPU usage is low:

Simulate load:
```bash
sudo dnf install stress -y
stress --cpu 4
```

Stop test processes:
```bash
pkill dd
```
🧹 Cleanup

Stop all background CPU tasks:
```bash
pkill dd
```
🏁 Conclusion

In this lab, you:

Learned about Linux process priorities.

Used nice to set initial process priority.

Used renice to modify the priority of running processes.

Observed how priority affects CPU allocation in real time.

These skills are important for:

System performance optimization

Managing heavy workloads

Prioritizing critical processes in production or container environments
