# 🧪 Lab 19: Managing Logical Volumes with LVM

## 🎯 Objectives
By the end of this lab, you will be able to:

- Create and manage **Physical Volumes (PVs)** and **Volume Groups (VGs)** using `pvcreate` and `vgcreate`.
- Allocate and resize **Logical Volumes (LVs)** using `lvcreate` and `lvextend`.
- Create and manage **LVM snapshots** for backup and recovery.

---

## 🧰 Prerequisites
- Linux-based system (RHEL, CentOS, or Fedora recommended)
- Root or sudo privileges
- Unallocated disk space or additional virtual disks
- Basic familiarity with Linux command line

---

## ⚙️ Task 1: Creating Physical Volumes and Volume Groups

### 🔹 Subtask 1.1: Identify Available Disks

List available block devices:
```bash
lsblk
```
Expected Output:
```bash
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0   40G  0 disk
├─sda1   8:1    0  500M  0 part /boot
└─sda2   8:2    0 39.5G  0 part /
sdb      8:16   0   10G  0 disk
sdc      8:32   0   10G  0 disk
```

Identify your unused disks (e.g., /dev/sdb, /dev/sdc).

🔹 Subtask 1.2: Create Physical Volumes

Initialize the disks as Physical Volumes (PVs):
```bash
sudo pvcreate /dev/sdb /dev/sdc
```

Verify the created PVs:
```bash
sudo pvs
```

Expected Output:
```bash
PV         VG   Fmt  Attr PSize  PFree
/dev/sdb        lvm2 a--  10.00g 10.00g
/dev/sdc        lvm2 a--  10.00g 10.00g
```
🔹 Subtask 1.3: Create a Volume Group

Combine both PVs into a Volume Group named my_vg:
```bash
sudo vgcreate my_vg /dev/sdb /dev/sdc
```

Verify:
```bash
sudo vgs
```

Expected Output:
```bash
VG     #PV #LV #SN Attr   VSize   VFree
my_vg    2   0   0 wz--n-  19.99g 19.99g
```
⚙️ Task 2: Allocating and Resizing Logical Volumes

🔹 Subtask 2.1: Create a Logical Volume

Create a 5GB Logical Volume named my_lv in my_vg:
```bash
sudo lvcreate -L 5G -n my_lv my_vg
```

Verify:
```bash
sudo lvs
```

Expected Output:
```bash
LV     VG     Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
my_lv  my_vg  -wi-a----- 5.00g
```
🔹 Subtask 2.2: Format and Mount the LV

Format it as ext4 and mount it:
```bash
sudo mkfs.ext4 /dev/my_vg/my_lv
sudo mkdir /mnt/mylv
sudo mount /dev/my_vg/my_lv /mnt/mylv
```

Verify mount and size:
```bash
df -h /mnt/mylv
```

Expected Output:
```bash
Filesystem               Size  Used Avail Use% Mounted on
/dev/mapper/my_vg-my_lv  5.0G   24M  4.8G   1% /mnt/mylv
```
🔹 Subtask 2.3: Extend the Logical Volume

Extend my_lv by 2GB:
```bash
sudo lvextend -L +2G /dev/my_vg/my_lv
sudo resize2fs /dev/my_vg/my_lv
```

Recheck the size:
```bash
df -h /mnt/mylv
```
Expected Output:
```bash
Filesystem               Size  Used Avail Use% Mounted on
/dev/mapper/my_vg-my_lv  7.0G   24M  6.8G   1% /mnt/mylv
```
🧩 Task 3: Creating and Managing Snapshots

🔹 Subtask 3.1: Create a Snapshot

Create a 1GB snapshot of my_lv:
```bash
sudo lvcreate -L 1G -s -n my_snapshot /dev/my_vg/my_lv
```

Verify snapshot creation:
```bash
sudo lvs
```

Expected Output:
```bash
LV           VG     Attr       LSize  Origin Data%  Meta%  Move Log Cpy%Sync Convert
my_lv        my_vg  owi-aos--- 7.00g
my_snapshot  my_vg  swi-a-s--- 1.00g  my_lv  0.00
```
🔹 Subtask 3.2: Restore from Snapshot

To revert my_lv back to the snapshot state:

Unmount the logical volume:
```bash
sudo umount /mnt/mylv
```

Merge (restore) the snapshot:
```bash
sudo lvconvert --merge /dev/my_vg/my_snapshot
```

Remount the volume:
```bash
sudo mount /dev/my_vg/my_lv /mnt/mylv
```

Expected Output:

Restores LV to the state captured in the snapshot.

🏁 Conclusion

In this lab, you learned how to:

Create and manage Physical Volumes and Volume Groups

Allocate, resize, and mount Logical Volumes

Use LVM snapshots for efficient backup and recovery

LVM provides a powerful, flexible storage management layer for modern Linux systems — making resizing, migration, and backup operations seamless.
