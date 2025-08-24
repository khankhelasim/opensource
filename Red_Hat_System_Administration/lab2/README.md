# Lab 2: Logging into RHEL and Using the Shell

## Objectives
By the end of this lab, I was able to:
- Log in to a RHEL system locally via the console.
- Log in to a RHEL system remotely using SSH.
- Execute basic shell commands (`pwd`, `ls`, `man`, `exit`).
- Customize the shell prompt using the `PS1` variable.

## Prerequisites
- RHEL 8 or 9 system (physical or VM).
- Network connectivity (for SSH).
- A user account with standard privileges.
- SSH server running on the RHEL system for remote login.

## Tasks Completed

### Task 1: Local Console Login
- Logged in to the RHEL console with username and password.
- Verified successful login with the default shell prompt.

### Task 2: Remote SSH Login
- Checked SSH service status with `systemctl`.
- Found RHEL system IP using `ip a`.
- Connected from a remote system using `ssh username@ip`.

### Task 3: Basic Shell Commands
- Used `pwd` to print working directory.
- Used `ls` with options (`-l`, `-a`, `-lh`) to list contents.
- Viewed manual pages with `man ls`.
- Exited session using `exit`.

### Task 4: Customize Shell Prompt
- Viewed current prompt variable with `echo $PS1`.
- Temporarily changed prompt to include time.
- Made permanent changes by editing `~/.bashrc`.

## Key Learnings
- Difference between **local login** and **remote SSH login**.
- How to troubleshoot SSH login issues with `ping` and `firewall-cmd`.
- Learned essential shell commands for navigation and help.
- Customized the prompt to display useful info like username, host, and time.

## Next Steps
- Practice SSH key-based authentication.
- Explore advanced shell commands (`grep`, `find`, `history`).
- Continue to build a personalized and efficient shell environment.

