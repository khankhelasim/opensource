# Commands Used in Lab 2: Logging into RHEL and Using the Shell

## Task 1: Local Console Login
Login screen example:

Red Hat Enterprise Linux 9.0 (Plow)

Kernel 5.14.0-70.el9.x86_64 on an x86_64

localhost login: user

Password:

[user@localhost ~]$

---

## Task 2: Remote SSH Login

Check SSH service status:

```bash

sudo systemctl status sshd

Find system IP address:


ip a

Connect via SSH from another system:

ssh username@<rhel-ip>

Test connectivity if issues:

ping <rhel-ip>

sudo firewall-cmd --list-all

Task 3: Basic Shell Commands

Print working directory:

pwd

List files:


ls

ls -l

ls -a

ls -lh

Manual pages:

man ls

Exit session:

exit

Task 4: Customize Shell Prompt (PS1)

View current prompt variable:

echo $PS1

Temporarily change prompt:

PS1="[\u@\h \W \t]\$ "

Make permanent:

nano ~/.bashrc

Add:

export PS1="[\u@\h \W \t]\$ "

Reload bashrc:

source ~/.bashrc

Common PS1 Symbols

\u → Username

\h → Hostname

\W → Current directory

\t → Time

