#!/bin/bash
MOUNTPOINT="/mnt/mydisk"
DEVICE="/dev/sdX1"   # <-- change this to your partition

sudo mkdir -p $MOUNTPOINT
echo "Mounting $DEVICE at $MOUNTPOINT"
sudo mount $DEVICE $MOUNTPOINT
df -h $MOUNTPOINT

echo "Unmounting..."
sudo umount $MOUNTPOINT
df -h

