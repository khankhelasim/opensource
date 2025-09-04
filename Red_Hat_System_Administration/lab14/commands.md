
---

#### 3. `commands.sh`
```bash
#!/bin/bash

# Lab 14: Installing and Updating Software Packages

# Task 1: Register system with RHSM (RHEL only)
sudo subscription-manager status

sudo subscription-manager register --username=<your_username> --password=<your_password> --auto-attach || echo "Skipping for Fedora/CentOS"

# Task 2: Manage repositories

sudo dnf repolist all


sudo dnf config-manager --enable epel || true

sudo dnf config-manager --disable epel || true


# Task 3: Install, remove, update packages

sudo dnf install -y httpd

sudo dnf remove -y httpd

sudo dnf update -y

# Task 4: Groups and modules

sudo dnf group list

sudo dnf group install -y "Development Tools"

sudo dnf module list

sudo dnf module enable -y nodejs:18

sudo dnf install -y nodejs
