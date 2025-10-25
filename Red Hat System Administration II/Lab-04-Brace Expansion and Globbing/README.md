# Lab 4: Brace Expansion and Globbing

## 🎯 Objectives
- Understand and utilize brace expansion for efficient file generation  
- Master globbing patterns for file matching  
- Combine brace expansion and globbing for advanced file operations  

## 🧩 Prerequisites
- Linux-based OS (Ubuntu 22.04 LTS recommended)  
- Basic command-line familiarity  
- Bash shell version 5.0 or newer  

## ⚙️ Setup
```bash
mkdir lab4_brace_globbing && cd lab4_brace_globbing
🧠 Task 1: Brace Expansion Fundamentals
🔹 Subtask 1.1: Basic Brace Expansion
echo file_{1..5}.txt


Expected Output:

file_1.txt file_2.txt file_3.txt file_4.txt file_5.txt

🔹 Subtask 1.2: Create Multiple Files
touch report_{jan,feb,mar}_2023.log
ls -l report_*.log


🧩 Tip: Ensure you have write permissions in your current directory.

🧠 Task 2: Globbing Patterns
🔹 Subtask 2.1: Basic Globbing
ls *.log
ls report_*

🔹 Subtask 2.2: Advanced Pattern Matching
ls report_[0-9]*.log
ls report_[abc]*.log


💡 Key Concept:
? matches exactly one character.
* matches zero or more characters.

🧠 Task 3: Combining Brace Expansion and Globbing
🔹 Subtask 3.1: Complex File Operations
mkdir -p projects/{src,bin,doc}/{web,cli,api}_{dev,prod}
tree projects/

🔹 Subtask 3.2: Bulk File Operations
touch file_{a..d}{1..3}.tmp
mkdir backup
mv file_[a-b]?.tmp backup/


✅ Expected: Only file_a1.tmp through file_b3.tmp move to backup/.

🏁 Conclusion

Brace expansion ({}) efficiently generates filenames and strings.

Globbing (*, ?, []) matches existing files using flexible patterns.

Combining both provides powerful file automation capabilities.
