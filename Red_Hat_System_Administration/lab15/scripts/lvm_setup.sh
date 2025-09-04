#!/bin/bash
DISK="/dev/sdX"    # change to your unused disk
VG="myvg"
LV="mylv"
SIZE="5G"

echo "Creating Physical Volume..."
sudo pvcreate $DISK

echo "Creating Volume Group $VG..."
sudo vgcreate $VG $DISK

echo "Creating Logical Volume $LV ($SIZE)..."
sudo lvcreate -L $SIZE -n $LV $VG

echo "Formatting and mounting..."
sudo mkfs.ext4 /dev/$VG/$LV
sudo mkdir -p /mnt/lvm
sudo mount /dev/$VG/$LV /mnt/lvm
df -h /mnt/lvm

