
---

### ⚙️ **2. manage_system.sh**
Save as: `Lab-02-Aliases-and-Functions/manage_system.sh`

```bash
#!/bin/bash
# ===============================================
# Lab 2 - Manage System Script Using Aliases
# Author: Asim Rasheed
# Description: Demonstrates alias usage inside a shell script
# ===============================================

# Enable alias expansion
shopt -s expand_aliases

# Source user aliases
source ~/.bashrc

echo "==============================================="
echo "System update starting..."
echo "==============================================="
update

echo
echo "==============================================="
echo "Current containers:"
echo "==============================================="
pps
