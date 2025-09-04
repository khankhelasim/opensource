# Lab 14: Step-by-Step Guide

## Task 1: Registering a System Subscription
```bash
sudo subscription-manager status

sudo subscription-manager register --username=<your_username> --password=<your_password> --auto-attach

Task 2: Enabling and Disabling Repositories


sudo dnf repolist all

sudo dnf config-manager --enable <repo_name>

sudo dnf install epel-release -y

sudo dnf config-manager --enable epel

sudo dnf config-manager --disable <repo_name>

Task 3: Installing, Removing, and Updating Packages

sudo dnf install -y httpd

sudo dnf remove -y httpd

sudo dnf update -y

Task 4: Working with Package Groups and Modules

sudo dnf group list

sudo dnf group install -y "Development Tools"


sudo dnf module list
sudo dnf module enable -y nodejs:18
sudo dnf install -y nodejs
