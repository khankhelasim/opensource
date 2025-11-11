# 🧪 Lab 3: Using grep and Regular Expressions

## 🎯 Objectives
By the end of this lab, you will be able to:
- Use `grep` to search for text patterns in files.
- Apply basic and advanced regular expressions (regex) with `grep`.
- Search and filter log files efficiently using regex.
- Understand common `grep` options for refined searches.

---

## 🧩 Prerequisites
- Linux-based system (Ubuntu, Fedora, or CentOS)
- Basic command-line knowledge
- Access to terminal and text editor (nano, vim)

---

## 🧱 Task 1: Basic grep Usage

### 🔹 Subtask 1.1: Simple Text Search
```bash
echo -e "apple\nbanana\ncherry\ndate\nelderberry\nfig\ngrape" > sample.txt
grep "banana" sample.txt
```
Expected Output:
```bash
banana
```
### 🔹 Subtask 1.2: Case-Insensitive Search
```bash
grep -i "Apple" sample.txt
```

Expected Output:
```bash
apple
```
### 🔹 Subtask 1.3: Count Matching Lines
```bash
grep -c "a" sample.txt
```

Expected Output:
```bash
4
```
## 🧮 Task 2: Regular Expressions with grep
### 🔹 Subtask 2.1: Basic Regex Patterns
#### Search for lines starting with "a"
```bash
grep "^a" sample.txt
```

Expected Output:
```bash
apple
```
#### Search for lines ending with "e"
```bash
grep "e$" sample.txt
```

Expected Output:
```bash
apple
date
grape
```
### 🔹 Subtask 2.2: Character Classes
```bash
grep "[aeiou]p" sample.txt
```

Expected Output:
```bash
apple
grape
```
### 🔹 Subtask 2.3: Quantifiers
```bash
grep -E "[aeiou]{2,}" sample.txt
```

Expected Output:
```bash
banana
elderberry
```
## 📜 Task 3: Searching Log Files
### 🔹 Subtask 3.1: Filter Log Entries
```bash
sudo cp /var/log/syslog /tmp/syslog_sample
grep -i "error" /tmp/syslog_sample
```

Expected Output:

All lines containing “error” (case-insensitive).

### 🔹 Subtask 3.2: Extract Timestamps
```bash
grep -E "^[A-Za-z]{3} [0-9]{2}" /tmp/syslog_sample
```

Expected Output:

Lines starting with a month and date (e.g., Mar 15).

🧩 Troubleshooting Tips

Ensure file path is correct.

Verify your pattern matches content.

Use grep --help to explore options.

Test regex at regex101.com
.

🏁 Conclusion

You learned how to:

Perform text searches using grep.

Use regex for flexible pattern matching.

Filter and extract information from logs.

📘 Next: Try exploring /var/log/ to practice real system logs.
