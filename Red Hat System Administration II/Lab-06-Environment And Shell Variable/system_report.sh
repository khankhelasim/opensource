#!/bin/bash
current_users=$(who | wc -l)
disk_usage=$(df -h / | awk 'NR==2 {print $5}')

echo "System Report:"
echo "Active users: $current_users"
echo "Root FS usage: $disk_usage"
