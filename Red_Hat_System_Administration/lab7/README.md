# Lab 7: Controlling File Permissions and Ownership

## Objectives
By the end of this lab, you will be able to:
- View and interpret Linux file permissions using `ls -l`
- Modify permissions using `chmod`, `chown`, and `chgrp`
- Configure special permission bits (SUID, SGID, sticky bit)
- Inspect SELinux security contexts
- Apply proper file ownership and permission management

## Prerequisites
- A Linux system (Fedora, RHEL, CentOS recommended)
- Root or sudo privileges
- Basic Linux command line knowledge

## Files in this Lab
- `steps.md`: Contains all the lab steps
- `commands.sh`: Ready-to-run script of all commands

## Cleanup
```bash
rm -rf ~/permissions_lab

