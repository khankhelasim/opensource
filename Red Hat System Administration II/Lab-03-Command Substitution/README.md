# Lab 3: Command Substitution

## 🎯 Objectives
- Understand and implement command substitution in shell scripting  
- Use both `$()` and backtick syntax for command substitution  
- Create dynamic file operations using command substitution  
- Build efficient command pipelines that pass output between commands

---

## 🧰 Prerequisites
- Basic Linux command line knowledge  
- Access to a terminal in any Linux distribution  
- Standard GNU core tools (`find`, `grep`, etc.) installed

---

## ⚙️ Setup Requirements
```bash
mkdir command_substitution_lab
cd command_substitution_lab
touch file1.txt file2.log data.csv config.ini backup.tar.gz
🧩 Task 1: Basic Command Substitution
Subtask 1.1 — Using $() Syntax
echo "Today is $(date)"
echo "There are $(ls | wc -l) files in this directory"

Subtask 1.2 — Using Backtick Syntax
echo "Today is `date`"
echo "Test 1: $(echo $(date))"
echo "Test 2: `echo \`date\``"

📁 Task 2: Dynamic File Operations
Subtask 2.1 — Finding and Processing Files
cat $(find . -name "*.txt")
wc -l $(find . -name "*.log")

Subtask 2.2 — Advanced File Operations
tar czf config_backup_$(date +%Y%m%d).tar.gz $(find . -name "*.ini")
du -h $(find . -size +1M)

⚙️ Task 3: Building Command Pipelines
Subtask 3.1 — Simple Pipelines
echo "There are $(ps aux | wc -l) processes running"
ls -S | head -n 1

Subtask 3.2 — Nested Substitution
echo "Newest file was modified at $(date -r $(ls -t | head -n 1))"
echo "The largest file is $(du -h $(find . -type f) | sort -h | tail -n 1)"

🧠 Key Takeaways

$() is preferred over backticks (``) for modern scripting.

Command substitution allows dynamic script behavior.

Proper escaping is crucial when nesting substitutions.

This is a core concept for writing efficient Bash automation scripts.
