# Lab 17: Configuring I/O Scheduler

## 🎯 Objectives
By the end of this lab, you will be able to:
- Understand the role of I/O schedulers in Linux.
- Check and modify the current I/O scheduler.
- Evaluate different schedulers for performance.
- Apply persistent scheduler configurations.

---

## 🧩 Prerequisites
- Linux system with root or sudo access.
- Basic terminal knowledge.
- `sysstat` package installed (for `iostat`).
- At least one disk device available for testing.

---

## 🧠 Introduction
The **I/O scheduler** determines how Linux manages read/write operations to disks.  
Different schedulers are optimized for different workloads:

| Scheduler | Ideal Use Case | Description |

|------------|----------------|--------------|

| **mq-deadline** | General servers | Ensures fairness and prevents starvation |

| **bfq** | Desktop systems | Prioritizes interactivity |

| **kyber** | SSD/NVMe drives | Optimized for low latency |

| **none** | Virtualized or RAID setups | Disables scheduling for hardware-level control |

---

## ⚙️ Task 1: Check Current I/O Scheduler

### 🔹 1.1 Install Required Tools
```bash
# For RHEL/CentOS/Fedora
sudo dnf install sysstat -y
```
```bash
# For Debian/Ubuntu
sudo apt install sysstat -y
```
🔹 1.2 Check Available Schedulers
```bash
ls /sys/block/sd*/queue/scheduler
```

Check current scheduler for each disk:
```bash
for disk in /sys/block/sd*; do
  echo "Disk: ${disk##*/}, Scheduler: $(cat $disk/queue/scheduler)"
done
```

Example Output:

Disk: sda, Scheduler: [mq-deadline] kyber bfq none


📘 The scheduler in [brackets] is currently active.

🔹 1.3 Monitor I/O Statistics
```bash
iostat -x 2
```

Key metrics to observe:

%util → CPU time spent waiting for I/O.

await → Average time to process an I/O request.

svctm → Average service time.

⚙️ Task 2: Change I/O Scheduler

🔹 2.1 Change Scheduler Temporarily
```bash
echo 'mq-deadline' | sudo tee /sys/block/sda/queue/scheduler
cat /sys/block/sda/queue/scheduler
```

💡 Tip: Replace sda with your actual disk name.

If you get “Permission denied”, use:
```bash
sudo bash -c "echo 'mq-deadline' > /sys/block/sda/queue/scheduler"
```
🔹 2.2 Make Scheduler Change Persistent

Create a new udev rule:
```bash
sudo nano /etc/udev/rules.d/60-io-schedulers.rules
```

Add the following line (adjust to your device):
```bash
ACTION=="add|change", KERNEL=="sda", ATTR{queue/scheduler}="mq-deadline"
```

Apply changes:
```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```
⚙️ Task 3: Test Different I/O Schedulers

🔹 3.1 Common Scheduler Types

Scheduler	Description

mq-deadline	Ensures fairness and predictable latency

bfq	Designed for desktop workloads

kyber	Great for SSD/NVMe performance

none	Minimal overhead, used in virtual or RAID setups

🔹 3.2 Performance Test

Create a test file:
```bash
dd if=/dev/zero of=testfile bs=1M count=1024 conv=fdatasync
```

Test read performance:
```bash
echo 3 | sudo tee /proc/sys/vm/drop_caches
time dd if=testfile of=/dev/null bs=1M
```

Run this test for each scheduler and compare the real time output.

🔹 3.3 Workload-Specific Tests (Optional)

For random write (database-like):
```bash
fio --name=random-write --ioengine=posixaio --rw=randwrite --bs=4k \
    --size=1g --numjobs=1 --iodepth=1 --runtime=60 --time_based --end_fsync=1
```

For sequential read (file server-like):
```bash
fio --name=seq-read --ioengine=posixaio --rw=read --bs=1M \
    --size=1g --numjobs=1 --iodepth=32 --runtime=60 --time_based
```

📊 Compare IOPS and bandwidth results for different schedulers.

🧹 Cleanup

Remove test files:
```bash
rm testfile
```
🏁 Conclusion

In this lab, you learned how to:

Identify and modify I/O schedulers.

Test different schedulers for performance.

Configure persistent scheduler settings via udev rules.

Final Recommendations:

System Type	Recommended Scheduler

Server	mq-deadline

Desktop	bfq

SSD/NVMe	kyber

Virtualized/RAID	none

Always benchmark with your actual workload before deciding.
