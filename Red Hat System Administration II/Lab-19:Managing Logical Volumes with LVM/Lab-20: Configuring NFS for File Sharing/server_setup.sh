#!/bin/bash
# Lab 20 - NFS Server Setup Script
# Run this script on the SERVER machine

echo "=== Updating System ==="
sudo apt update -y || sudo dnf update -y

echo "=== Installing NFS Server Packages ==="
if command -v apt &> /dev/null; then
    sudo apt install -y nfs-kernel-server
else
    sudo dnf install -y nfs-utils
fi

echo "=== Creating Shared Directory ==="
sudo mkdir -p /mnt/nfs_share
sudo chown nobody:nobody /mnt/nfs_share
sudo chmod 777 /mnt/nfs_share

echo "=== Configuring NFS Exports ==="
echo "/mnt/nfs_share client_ip(rw,sync,no_subtree_check)" | sudo tee /etc/exports

echo "=== Applying Export Settings ==="
sudo exportfs -arv

echo "=== Enabling and Starting NFS Service ==="
sudo systemctl enable --now nfs-server
sudo systemctl status nfs-server --no-pager

echo "=== Configuring Firewall ==="
sudo firewall-cmd --add-service={nfs,nfs3,mountd,rpc-bind} --permanent
sudo firewall-cmd --reload

echo "=== Server Configuration Complete ==="
