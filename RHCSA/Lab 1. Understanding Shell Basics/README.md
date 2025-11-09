# Lab 1: Understanding Shell Basics

## Objectives
By the end of this lab, you will be able to:
- Understand the structure of shell commands.
- Execute basic shell commands (`ls`, `pwd`, `cd`).
- Manage input/output redirection in the shell.
- Navigate the file system efficiently.

## Prerequisites
- A Linux-based operating system (Ubuntu, Fedora, CentOS, etc.)
- Access to a terminal or shell.
- Basic familiarity with command-line interfaces.

---

## 🧩 Tasks Breakdown

### Task 1: Learn About Shell Commands and Their Structure

**Syntax:**
command [options] [arguments]


**Example:**

```bash
ls -l /home
```
- `ls` → command  

- `-l` → option  

- `/home` → argument  

📘 *Outcome:* You understand how shell command syntax works.

---

### Task 2: Experiment with Basic Shell Commands

#### 🔹 Subtask 2.1 — Listing Files

```bash
ls
ls -l
ls -a
```
**Outcome:** List visible and hidden files in current directory.

#### 🔹 Subtask 2.2 — Print Working Directory

```bash
pwd
```
**Outcome:** Displays your current directory path.

#### 🔹 Subtask 2.3 — Change Directory
```bash
cd ~
cd /tmp
cd ..
pwd
```
**Outcome:** Successfully navigate between directories.

---

### Task 3: Manage Input/Output with the Shell

#### 🔹 Subtask 3.1 — Output Redirection (`>`)

```bash
ls -l > file_list.txt
cat file_list.txt
```
**Outcome:** The output of `ls -l` is saved in a file.

#### 🔹 Subtask 3.2 — Append Output (`>>`)

```bash
date >> file_list.txt
cat file_list.txt
```
**Outcome:** Appends date/time to existing file content.

#### 🔹 Subtask 3.3 — Input Redirection (`<`)

```bash
echo -e "Alice\nBob\nCharlie" > names.txt
sort < names.txt
```
**Outcome:** Sorts file content alphabetically.

---

## 🧠 Conclusion

You learned:

- Shell command structure

- Basic commands (`ls`, `pwd`, `cd`)

- Input/output redirection (`>`, `>>`, `<`)

These are essential foundational skills for all Linux users and the **RHCSA certification**.

---

✅ **Next Step:** Proceed to **Lab 2 – Managing Files and Directories** once this lab is completed.
