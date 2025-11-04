#!/bin/bash
# Lab 20 - NFS Client Setup Script
# Run this script on the CLIENT machine

SERVER_IP="server_ip"

echo "=== Updating System ==="
sudo apt update -y || sudo dnf update -y

echo "=== Installing NFS Client Packages ==="
if command -v apt &> /dev/null; then
    sudo apt install -y nfs-common
else
    sudo dnf install -y nfs-utils
fi

echo "=== Creating Mount Point ==="
sudo mkdir -p /mnt/nfs_mount

echo "=== Mounting NFS Share ==="
sudo mount -t nfs $SERVER_IP:/mnt/nfs_share /mnt/nfs_mount

echo "=== Verifying Mount ==="
df -hT | grep nfs

echo "=== Making Mount Persistent ==="
echo "$SERVER_IP:/mnt/nfs_share  /mnt/nfs_mount  nfs  defaults  0  0" | sudo tee -a /etc/fstab
sudo mount -a

echo "=== Client Configuration Complete ==="
