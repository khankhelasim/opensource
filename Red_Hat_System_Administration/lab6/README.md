# Lab 6: Managing Users and Groups

## Objectives
- Create and manage local users and groups
- Configure password policies
- Modify user and group attributes
- Remove users and groups

## Tasks

### Task 1: User Management

```bash
# Create a new user

sudo useradd -m -s /bin/bash labuser1

# Set password for the user

sudo passwd labuser1

# Modify user shell

sudo usermod -s /bin/zsh labuser1

# Add comment to user

sudo usermod -c "Lab User 1" labuser1

# Verify changes

grep labuser1 /etc/passwd

### Task 2: Group Management

# Create group

sudo groupadd labgroup

# Add user to group

sudo usermod -aG labgroup labuser1

# Verify

groups labuser1

# Set group administrator

sudo gpasswd -A labuser1 labgroup

# Add another user

sudo gpasswd -a labuser2 labgroup

### Task 3: Password Policies

# Set password expiration policy

sudo chage -M 90 -m 7 -W 14 labuser1

# View policy

sudo chage -l labuser1

### Task 4: Cleanup

# Remove user (keep home)

sudo userdel labuser1

# Remove user with home

sudo userdel -r labuser2

# Remove group

sudo groupdel labgroup
