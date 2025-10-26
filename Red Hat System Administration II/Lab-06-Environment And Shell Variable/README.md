# Lab 6: Environment and Shell Variables

## 🎯 Objectives
- Understand the difference between environment and shell variables  
- Learn to set, view, and use environment variables  
- Create and manipulate shell variables in scripts  
- Implement variables for storing frequently used values in automation  

---

## 🧠 Prerequisites
- Linux system with Bash shell (4.x or newer)  
- Basic understanding of command line operations  
- Text editor (nano/vim/gedit)  

---

## 🧩 Task 1: Working with Environment Variables

### 🔹 Subtask 1.1: Viewing Environment Variables
```bash
printenv
echo $HOME
echo $PATH
Expected:
Lists all environment variables and shows specific values for HOME and PATH.

🔹 Subtask 1.2: Setting Temporary Environment Variables
export LAB_USER="dev_user"
echo $LAB_USER


Expected:
Outputs dev_user

Note: This variable disappears after the session ends.

🔹 Subtask 1.3: Making Variables Persistent
nano ~/.bashrc


Add this line at the bottom:

export PROJECT_DIR="/opt/my_project"


Apply changes:

source ~/.bashrc
echo $PROJECT_DIR

🧩 Task 2: Shell Variables in Scripts
🔹 Subtask 2.1: Basic Variable Usage

Create variables.sh

#!/bin/bash
greeting="Welcome"
user=$(whoami)
echo "$greeting $user! Today is $(date)"


Make it executable and run:

chmod +x variables.sh
./variables.sh

🔹 Subtask 2.2: Variable Scope Demonstration

Create scope_demo.sh

#!/bin/bash
global_var="I'm global"

function demo() {
    local local_var="I'm local"
    echo "Inside function: $global_var, $local_var"
}

demo
echo "Outside: $global_var"
echo "Local outside: $local_var"  # This will be empty


Key Concept:
local limits scope to within the function.

🧩 Task 3: Automation with Variables
🔹 Subtask 3.1: Configuration File with Variables

Create config.cfg

# Application configuration
MAX_RETRIES=3
LOG_LEVEL="DEBUG"
BACKUP_DIR="/var/backups"


Create app.sh

#!/bin/bash
source config.cfg

echo "Running with:"
echo "Retries: $MAX_RETRIES"
echo "Log Level: $LOG_LEVEL"
mkdir -p $BACKUP_DIR

🔹 Subtask 3.2: Command Substitution

Create system_report.sh

#!/bin/bash
current_users=$(who | wc -l)
disk_usage=$(df -h / | awk 'NR==2 {print $5}')

echo "System Report:"
echo "Active users: $current_users"
echo "Root FS usage: $disk_usage"

🧩 Troubleshooting Tips

❗ Variables don’t persist → Ensure correct shell config file (~/.bashrc)

❗ “Command not found” → Verify execute permissions (chmod +x file.sh)

❗ Variable not expanding → Use double quotes ("$var")

❗ Permission issues → Use sudo for system-wide edits (e.g. /etc/environment)

🏁 Conclusion

In this lab you:

Distinguished between environment and shell variables

Created persistent configuration using .bashrc

Developed scripts using variable scope and command substitution

Implemented configuration files for automation
