
---

### 📄 tasks.md
```markdown
# Lab 15: Accessing and Managing Linux Filesystems

## Task 1: Inspecting Block Devices
### 1.1 List Block Devices with lsblk
```bash

lsblk

lsblk -f

1.2 Examine Partitions with fdisk

sudo fdisk -l

sudo fdisk -l /dev/sdX

1.3 Identify Filesystems with blkid

sudo blkid

Task 2: Mounting and Unmounting Filesystems

2.1 Mount a Filesystem Temporarily

sudo mkdir /mnt/mydisk

sudo mount /dev/sdX1 /mnt/mydisk

df -h /mnt/mydisk

2.2 Unmount a Filesystem

sudo umount /mnt/mydisk

df -h

Task 3: Configuring Persistent Mounts (/etc/fstab)

3.1 Add Entry to /etc/fstab

sudo blkid /dev/sdX1

sudo nano /etc/fstab


Add:

UUID=your-uuid-here /mnt/mydisk ext4 defaults 0 2


Test:

sudo mount -a

df -h

Task 4: Managing LVM Volumes

4.1 Create an LVM Volume

sudo pvcreate /dev/sdX

sudo vgcreate myvg /dev/sdX

sudo lvcreate -L 5G -n mylv myvg

sudo mkfs.ext4 /dev/myvg/mylv

sudo mkdir /mnt/lvm

sudo mount /dev/myvg/mylv /mnt/lvm

4.2 Extend an LVM Volume

sudo lvextend -L +2G /dev/myvg/mylv

sudo resize2fs /dev/myvg/mylv

df -h /mnt/lvm

Troubleshooting

If mount fails, check errors:

dmesg | tail -20


For LVM issues:

vgdisplay

lvdisplay


Always back up /etc/fstab before editing.

Conclusion

In this lab, you learned to:

Inspect block devices using lsblk, fdisk, blkid

Mount and unmount filesystems manually and via /etc/fstab

Create and manage LVM volumes
