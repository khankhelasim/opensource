
---

### `commands.sh`
```bash
#!/bin/bash
# Lab 18: SELinux Basics - Command Script

# Check SELinux status
sestatus

# Install required packages
sudo dnf install -y setroubleshoot setools-console policycoreutils-python-utils

# Task 1: View SELinux contexts
touch /tmp/testfile.txt
ls -Z /tmp/testfile.txt
ls -Zd /tmp

# Task 2: Change contexts
sudo mkdir /web
ls -Zd /web
sudo chcon -t httpd_sys_content_t /web
ls -Zd /web
sudo restorecon -v /web
ls -Zd /web

# Task 3: Generate and fix AVC denial
sudo mkdir -p /web/html
sudo touch /web/html/index.html
sudo chcon -t user_home_t /web/html/index.html
sudo systemctl start httpd || sudo systemctl start apache2
curl http://localhost/html/index.html || true
sudo ausearch -m avc -ts recent
sudo sealert -a /var/log/audit/audit.log || true
sudo chcon -t httpd_sys_content_t /web/html/index.html
curl http://localhost/html/index.html || true

