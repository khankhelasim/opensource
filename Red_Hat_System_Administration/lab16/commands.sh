
---

### 📄 `commands.sh`
```bash
#!/bin/bash
# Lab 16: NFS and CIFS Setup & Mounting (Ubuntu)

set -e

echo "=== Installing required packages ==="
sudo apt update -y
sudo apt install -y nfs-kernel-server nfs-common cifs-utils samba smbclient

echo "=== Configuring NFS Server ==="
sudo mkdir -p /srv/nfs_share
sudo chown nobody:nogroup /srv/nfs_share
sudo chmod 777 /srv/nfs_share
echo "/srv/nfs_share 127.0.0.1(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports
sudo exportfs -rav
sudo systemctl restart nfs-kernel-server

echo "=== Mounting NFS Share ==="
sudo mkdir -p /mnt/nfs_share
sudo mount -t nfs 127.0.0.1:/srv/nfs_share /mnt/nfs_share

echo "=== Configuring CIFS (Samba) Server ==="
sudo mkdir -p /srv/smb_share
sudo chmod 777 /srv/smb_share
echo "[smbshare]
   path = /srv/smb_share
   browseable = yes
   read only = no
   guest ok = yes" | sudo tee -a /etc/samba/smb.conf
sudo systemctl restart smbd nmbd

echo "=== Mounting CIFS Share ==="
sudo mkdir -p /mnt/cifs_share
sudo mount -t cifs //127.0.0.1/smbshare /mnt/cifs_share -o guest

echo "=== Adding fstab entries ==="
sudo cp /etc/fstab /etc/fstab.bak
echo "127.0.0.1:/srv/nfs_share  /mnt/nfs_share   nfs   defaults,_netdev  0 0" | sudo tee -a /etc/fstab
echo "//127.0.0.1/smbshare     /mnt/cifs_share   cifs  guest,_netdev,uid=1000,gid=1000  0 0" | sudo tee -a /etc/fstab

echo "=== Testing fstab ==="
sudo umount /mnt/nfs_share /mnt/cifs_share
sudo mount -a
df -hT | grep -E "nfs|cifs"

echo "=== Lab 16 Completed Successfully ==="

