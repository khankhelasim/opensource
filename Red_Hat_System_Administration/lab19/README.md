# Lab 19: Using Red Hat Customer Portal and Cockpit

## Objectives
By the end of this lab, you will be able to:
- Navigate Red Hat Customer Portal to access support resources
- Open and manage support cases
- Install and configure Cockpit for system management
- Explore Cockpit's dashboard and log management features

## Prerequisites
- A RHEL 8/9 system with root or sudo access  
- Active Red Hat subscription  
- Internet connect

https://access.redhat.com

2. Click **Log in** and enter your Red Hat account credentials.  
3. Verify successful login by checking for your username in the top-right corner.  

✅ **Expected Outcome**: Red Hat Customer Portal dashboard is displayed.  

---

### Subtask 1.2: Access Knowledgebase Articles
1. In the portal search bar, type:  
RHEL 9 system logging
2. Review search results and open a relevant article.  
3. Note the documentation structure and available resources.  

💡 **Troubleshooting**: If no articles appear, make sure your account has active subscriptions.  

---

## Task 2: Opening Support Cases

### Subtask 2.1: Create a Support Case
1. From the portal header, select:  
**Support → Open a Case**  
2. Fill in case details:  
- **Product**: Red Hat Enterprise Linux  
- **Version**: (Select your RHEL version)  
- **Problem type**: Technical  
- **Description**: e.g. *"Cockpit service not starting"*  
3. Click **Submit**.  

✅ **Expected Outcome**: A case number is generated and confirmation email is received.  

---

## Task 3: Installing and Configuring Cockpit

### Subtask 3.1: Install Cockpit Packages
Run:
```bash
sudo dnf install cockpit cockpit-podman -y
sudo systemctl enable --now cockpit.socket
sudo systemctl status cockpit.socket
✅ Expected Outcome: Cockpit is installed and running on port 9090.

Subtask 3.2: Configure Firewall

Run:

sudo firewall-cmd --add-service=cockpit --permanent
sudo firewall-cmd --reload


💡 Verify port:

sudo ss -tulnp | grep 9090

Task 4: Exploring Cockpit Dashboard
Subtask 4.1: Access Cockpit Web Interface

Open a browser and go to:

https://<your-server-ip>:9090


Log in using your system credentials.

Subtask 4.2: Navigate Dashboard Features

System Overview → CPU, memory, disk usage

Logs → System journal entries

Networking → Interfaces and connections

Podman Containers → Manage containers (if cockpit-podman installed)

💡 Key Concept: Cockpit provides a unified web-based system administration interface.

Subtask 4.3: View System Logs

In Cockpit, click Logs (left sidebar).

Apply filters by:

Priority: Error / Warning

Time range

Service name (e.g., cockpit)

✅ Expected Outcome: Filtered logs are displayed.

🎯 Conclusion

In this lab, you:

Accessed Red Hat Customer Portal and Knowledgebase

Created a support case

Installed and configured Cockpit on RHEL

Explored system management and logs via Cockpit web interface
