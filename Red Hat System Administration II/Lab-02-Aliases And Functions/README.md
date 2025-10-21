# Lab 2: Aliases and Functions

## 🎯 Objectives
- Understand and create Bash aliases.
- Develop shell functions to automate command sequences.
- Persist aliases and functions in `.bashrc`.
- Use them inside automation scripts.
- Apply to simplify Podman container management tasks.

---

## 🧰 Prerequisites
- Linux system (RHEL, CentOS, Fedora, Ubuntu, etc.)
- Bash shell (`bash --version`)
- Podman installed (`podman --version`)
- Text editor (`nano`, `vim`, or VS Code)

---

## 🧪 Tasks

### **Task 1: Creating Aliases**

```bash
alias ll='ls -alF'
alias pps='podman ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"'
Make them persistent:

nano ~/.bashrc
alias update='sudo dnf update -y'
alias c='clear'
source ~/.bashrc

Task 2: Creating Shell Functions
function pcount() {
    podman ps -a
    echo "Total containers: $(podman ps -a -q | wc -l)"
}

function cstate() {
    if [ "$1" = "start" ]; then
        podman start $2
    elif [ "$1" = "stop" ]; then
        podman stop $2
    else
        echo "Usage: cstate [start|stop] [container]"
    fi
}

# Persistent cleanup function
echo '
function pclean() {
    podman container prune -f
    podman image prune -a -f
}' >> ~/.bashrc
source ~/.bashrc

Task 3: Using Aliases in Scripts

manage_system.sh → Script using aliases

container_report.sh → Script using functions

🧩 Expected Output

ll → Detailed file listing

pps → Formatted container list

pcount → Counts all containers

cstate start|stop → Starts or stops specific container

pclean → Cleans up unused containers/images

Scripts display system update and Podman reports.
