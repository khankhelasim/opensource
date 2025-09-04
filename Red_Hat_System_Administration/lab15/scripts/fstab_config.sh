#!/bin/bash
DEVICE="/dev/sdX1"   # change as needed
MOUNTPOINT="/mnt/mydisk"

UUID=$(blkid -s UUID -o value $DEVICE)

echo "Creating mount point $MOUNTPOINT"
sudo mkdir -p $MOUNTPOINT

echo "Adding entry to /etc/fstab"
echo "UUID=$UUID $MOUNTPOINT ext4 defaults 0 2" | sudo tee -a /etc/fstab

echo "Mounting all filesystems..."
sudo mount -a
df -h $MOUNTPOINT

