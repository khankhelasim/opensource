#!/bin/bash
# Validation Script for Lab 20

echo "=== Checking NFS Mount on Client ==="
mount | grep nfs

echo "=== Creating Test File ==="
sudo touch /mnt/nfs_mount/testfile_from_client.txt
ls -l /mnt/nfs_mount

echo "=== Now check on SERVER side ==="
echo "File should appear in /mnt/nfs_share/ as testfile_from_client.txt"
