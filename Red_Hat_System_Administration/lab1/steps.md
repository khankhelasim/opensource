# Commands Used in Lab 1: Introduction to RHEL

## Subtask 1.1: Define Open Source
```bash
curl -s https://opensource.org/osd | grep -A5 "Open Source Definition"
Fetches the Open Source Initiative (OSI) definition.
If curl is not installed:

sudo dnf install curl -y

Subtask 1.2: Check Linux Kernel Version
uname -r


Displays the Linux kernel version.

Subtask 2.1: Check Distribution Information
cat /etc/os-release


Displays OS name, version, and ID.

Subtask 3.1: Check SELinux Status
sestatus


Shows whether SELinux is enabled and enforcing.

Subtask 3.2: RHEL Subscription Management

Register system (requires Red Hat account):

sudo subscription-manager register --username <your_username> --password <your_password>


Attach subscription automatically:

sudo subscription-manager attach --auto


Verify active subscription:

sudo subscription-manager list --consumed


If subscription-manager is missing:

sudo dnf install subscription-manager -y
