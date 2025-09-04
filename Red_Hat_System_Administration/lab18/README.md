# Lab 18: Securing the System with SELinux Basics

## Objectives
By the end of this lab, you will be able to:
- Understand SELinux contexts and their importance in system security
- View and modify file contexts using `ls -Z` and `chcon`
- Interpret SELinux audit logs and troubleshoot AVC denials

## Prerequisites
- A Linux system with SELinux enabled (RHEL/CentOS/Fedora preferred)
- Root or sudo privileges
- Basic Linux command line knowledge
- `setroubleshoot`, `setools-console`, and `policycoreutils-python-utils` packages installed

## Setup
Verify SELinux status:
```bash
sestatus
Install required tools:

sudo dnf install -y setroubleshoot setools-console policycoreutils-python-utils

Tasks
Task 1: Viewing SELinux Contexts with ls -Z

Create a test file:

touch /tmp/testfile.txt


View file context:

ls -Z /tmp/testfile.txt


View directory context:

ls -Zd /tmp


Context format:
user:role:type:level

User = unconfined_u

Role = object_r

Type = user_tmp_t (most important for access control)

Level = s0

Task 2: Changing Contexts with chcon

Create a web directory:

sudo mkdir /web
ls -Zd /web


Change to httpd context:

sudo chcon -t httpd_sys_content_t /web
ls -Zd /web


Restore default:

sudo restorecon -v /web
ls -Zd /web

Task 3: Interpreting Audit Logs and AVC Denials

Generate a denial:

sudo mkdir -p /web/html
sudo touch /web/html/index.html
sudo chcon -t user_home_t /web/html/index.html
sudo systemctl start httpd   # or apache2 on Ubuntu
curl http://localhost/html/index.html


Analyze denial:

sudo ausearch -m avc -ts recent
sudo sealert -a /var/log/audit/audit.log


Look for source context, target context, denied permission.

Fix the context:

sudo chcon -t httpd_sys_content_t /web/html/index.html
curl http://localhost/html/index.html

Troubleshooting

If sealert doesn’t run:

sudo systemctl start setroubleshoot


For permanent changes:

sudo semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
sudo restorecon -Rv /web


To temporarily relax enforcement:

sudo setenforce 0

Conclusion

In this lab, you:

Viewed and interpreted SELinux contexts with ls -Z

Modified file contexts with chcon

Resolved AVC denials using audit logs

Learned that proper labeling is critical for SELinux security
