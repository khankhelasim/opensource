# Lab 16: Working with Network File Systems (NFS and CIFS) – Ubuntu Version

## Objectives
By the end of this lab, you will be able to:
- Install necessary packages for NFS and CIFS
- Mount remote NFS and CIFS shares
- Configure persistent mounts using `/etc/fstab`
- Verify and troubleshoot network file system connections

---

## Prerequisites
- Ubuntu system with root/sudo access
- Basic Linux command-line knowledge
- Network connectivity (loopback used for local testing)
- For CIFS: Samba server configured locally

---

## Tasks

### Task 1: Install Required Packages
```bash
sudo apt update -y

sudo apt install -y nfs-kernel-server nfs-common cifs-utils samba smbclient

Task 2: Configure and Mount NFS Share

Server Setup

sudo mkdir -p /srv/nfs_share

sudo chown nobody:nogroup /srv/nfs_share

sudo chmod 777 /srv/nfs_share

echo "/srv/nfs_share 127.0.0.1(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

sudo exportfs -rav

sudo systemctl restart nfs-kernel-server


Client Mount

sudo mkdir -p /mnt/nfs_share

sudo mount -t nfs 127.0.0.1:/srv/nfs_share /mnt/nfs_share


Verification

df -hT | grep nfs

ls /mnt/nfs_share

Task 3: Configure and Mount CIFS Share

Server Setup

sudo mkdir -p /srv/smb_share

sudo chmod 777 /srv/smb_share

echo "[smbshare]
   path = /srv/smb_share
   browseable = yes
   read only = no
   guest ok = yes" | sudo tee -a /etc/samba/smb.conf

sudo systemctl restart smbd nmbd


Client Mount

sudo mkdir -p /mnt/cifs_share

sudo mount -t cifs //127.0.0.1/smbshare /mnt/cifs_share -o guest


Verification

df -hT | grep cifs

ls /mnt/cifs_share

Task 4: Configure Persistent Mounts in /etc/fstab

# Backup existing fstab

sudo cp /etc/fstab /etc/fstab.bak

# Add NFS entry

127.0.0.1:/srv/nfs_share  /mnt/nfs_share   nfs   defaults,_netdev  0 0

# Add CIFS entry

//127.0.0.1/smbshare     /mnt/cifs_share   cifs  guest,_netdev,uid=1000,gid=1000  0 0


Apply and Verify

sudo mount -a

df -hT | grep -E "nfs|cifs"

Key Learnings

NFS is commonly used in Unix/Linux environments

CIFS/SMB is common in Windows environments (Samba on Linux)

/etc/fstab ensures mounts persist across reboots

Credentials for CIFS can be stored securely (optional in this lab, we used guest access)

Final Verification

mount | grep -E "nfs|cifs"

cat /etc/fstab | grep -v '^#'


✅ This confirms your network file systems are properly configured!
