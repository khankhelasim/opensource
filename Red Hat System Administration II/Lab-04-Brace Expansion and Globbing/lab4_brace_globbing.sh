
---

### ⚙️ `lab4_brace_globbing.sh`
```bash
#!/bin/bash
# Lab 4: Brace Expansion and Globbing
# Author: Asim Rasheed
# Description: Demonstrates brace expansion and globbing operations in Bash.

echo "===== Lab 4: Brace Expansion and Globbing ====="

# Setup
mkdir -p lab4_brace_globbing
cd lab4_brace_globbing || exit

echo "---- Task 1: Brace Expansion ----"
echo "Basic brace expansion:"
echo file_{1..5}.txt

echo "Creating multiple log files..."
touch report_{jan,feb,mar}_2023.log
echo "Created files:"
ls -l report_*.log

echo "---- Task 2: Globbing Patterns ----"
echo "List all .log files:"
ls *.log

echo "List all files starting with 'report':"
ls report_*

echo "Using character classes and ranges:"
ls report_[0-9]*.log 2>/dev/null || echo "No digit-based log files found"
ls report_[abc]*.log 2>/dev/null || echo "No abc-based log files found"

echo "---- Task 3: Combining Brace Expansion and Globbing ----"
echo "Creating nested directories..."
mkdir -p projects/{src,bin,doc}/{web,cli,api}_{dev,prod}
tree projects/

echo "Creating test files..."
touch file_{a..d}{1..3}.tmp

mkdir -p backup
echo "Moving files matching [a-b]?.tmp pattern..."
mv file_[a-b]?.tmp backup/

echo "Files moved to backup:"
ls backup/

echo "===== Lab 4 Complete! ====="
