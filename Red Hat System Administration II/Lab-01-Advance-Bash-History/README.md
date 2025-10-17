# Lab 1: Advanced Bash History and Search

## Objectives
- Master interactive history search in Bash
- Efficiently recall and modify previous commands
- Create custom aliases for enhanced history search

## Prerequisites
- Linux system with Bash 4.0+
- Basic command-line familiarity
- Standard user permissions

## Setup
```bash
bash --version
history -c
Tasks Overview
Task 1: Using Ctrl+R for Command History Search

Run sample commands:

echo "Hello World"
ls -l
date
whoami


Press Ctrl+R and type part of the command (e.g., “echo”) to recall it.

Use Ctrl+R repeatedly to go backward, Ctrl+S to go forward, Ctrl+G to exit.

Task 2: Advanced History Search

Example commands:

grep "error" /var/log/syslog
find ~ -name "*.txt"
docker ps -a


Use Ctrl+R to search for “docker” or “find name”.

Edit recalled command using arrow keys before pressing Enter.

Task 3: Custom History Configuration and Aliases

Edit ~/.bashrc:

# Increase history size
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
HISTCONTROL=ignoreboth

# Aliases
alias hs='history | grep --color=auto'
alias hsi='history | grep -i --color=auto'


Add the function for top commands:

function hst {
  history | awk '{print $2 " " $3 "\t" $4 "\t" $5FS$6FS$7FS$8FS$9FS$10}' | sort | uniq -c | sort -nr | head -n 20
}


Apply changes:

source ~/.bashrc

Verification
hs docker
hsi error
hst


Expected:

Matching commands highlighted

Top 20 frequently used commands with counts

Conclusion

You learned:

Reverse search with Ctrl+R

Modify previous commands before execution

Create persistent Bash history configs and aliases

View frequently used commands easily
