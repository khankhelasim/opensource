# Lab 10: Configuring and Securing SSH (Step-by-Step)

## Task 1: Install OpenSSH Server

### Step 1.1: Check if SSH is Installed
```bash
ssh -V

Step 1.2: Install OpenSSH Server

For Ubuntu/Debian:

sudo apt update && sudo apt install openssh-server -y


For RHEL/CentOS:

sudo dnf install openssh-server -y

Step 1.3: Verify SSH Service Status

sudo systemctl status ssh


If inactive, start it:

sudo systemctl start ssh

Task 2: Secure SSH Configuration

Step 2.1: Backup Original Config

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

Step 2.2: Edit Configuration

Open file:

sudo nano /etc/ssh/sshd_config


Recommended changes:

Port 2222

PermitRootLogin no

PasswordAuthentication no

PubkeyAuthentication yes

AllowUsers your_username

Step 2.3: Restart SSH

sudo systemctl restart ssh


Check listening port:

ss -tulnp | grep ssh

Task 3: SSH Key Authentication

Step 3.1: Generate Key Pair (Client)

ssh-keygen -t ed25519 -C "your_email@example.com"

Step 3.2: Copy Public Key

ssh-copy-id -p 2222 username@server_ip

Step 3.3: Test Key-Based Login

ssh -p 2222 username@server_ip

Task 4: Configure Firewall

Step 4.1: Allow SSH Port

UFW (Ubuntu):

sudo ufw allow 2222/tcp

sudo ufw enable


firewalld (RHEL/CentOS):

sudo firewall-cmd --permanent --add-port=2222/tcp

sudo firewall-cmd --reload

Step 4.2: Verify Rules

UFW:

sudo ufw status


firewalld:

sudo firewall-cmd --list-ports

✅ Conclusion

Installed and secured OpenSSH server.

Modified sshd_config to disable root login and enforce key-based authentication.

Configured firewall to restrict SSH access.

Final Test:

ssh -p 2222 username@server_ip
