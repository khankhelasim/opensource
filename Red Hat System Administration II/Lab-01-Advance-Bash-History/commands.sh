
---

### ⚙️ `commands.sh`
```bash
#!/bin/bash
# Lab 1: Advanced Bash History and Search

echo "Hello World"
ls -l
date
whoami

# Example commands for history testing
grep "error" /var/log/syslog 2>/dev/null
find ~ -name "*.txt" 2>/dev/null
docker ps -a 2>/dev/null

echo "Now try interactive searches using Ctrl+R and Ctrl+S."
