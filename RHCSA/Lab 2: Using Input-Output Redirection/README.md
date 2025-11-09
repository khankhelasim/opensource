# Lab 2: Using Input-Output Redirection

## Objectives
By the end of this lab, you will be able to:
- Understand and implement output redirection using `>` and `>>`.
- Utilize pipes (`|`) to chain commands and process data efficiently.
- Redirect error messages using `2>` for better error handling.
- Combine different redirection techniques for advanced command-line operations.

## Prerequisites
- Linux-based system (physical or VM)
- Basic Linux command-line knowledge
- Terminal access with standard GNU utilities
- Podman installed (for container-related examples)

## Lab Setup
Verify your environment:
```bash
uname -a
podman --version
```
🧩 Tasks Breakdown

Task 1: Output Redirection

Subtask 1.1 — Basic Output Redirection (>)
```bash
echo "Hello, Red Hat OpenShift!" > greeting.txt
cat greeting.txt
echo "New content replaces old" > greeting.txt
cat greeting.txt
```

Key Concept: > creates or overwrites files.

Subtask 1.2 — Appending Output (>>)
```bash
echo "Additional line" >> greeting.txt
echo "Line 3" >> greeting.txt
echo "Line 4" >> greeting.txt
cat greeting.txt
```

Key Concept: >> appends to files without overwriting.

Task 2: Using Pipes

Subtask 2.1 — Basic Pipe Usage
```bash
ls -l | grep "greeting"
cat greeting.txt | wc -l
ps aux | grep podman | wc -l
```
Subtask 2.2 — Advanced Pipe Operations
```bash
cat greeting.txt | sort
cat greeting.txt | sort > sorted_greeting.txt
podman images | grep -v "<none>"
```
Task 3: Error Redirection

Subtask 3.1 — Redirect Standard Error (2>)
```bash
ls /nonexistent 2> error.log
cat error.log
ls /nonexistent /etc/passwd > output.log 2> error.log
cat output.log
cat error.log
```
Subtask 3.2 — Advanced Error Handling
```bash
ls /nonexistent /etc/passwd &> combined.log
ls /nonexistent 2> /dev/null
podman run --name testcontainer alpine /bin/false 2> container_error.log
cat container_error.log
```
Task 4: Combined Operations

Subtask 4.1 — Complex Redirection
```bash
(ls /etc/passwd /nonexistent | wc -l > success.log) 2> fail.log
cat success.log
cat fail.log
```
Subtask 4.2 — Practical Application
```bash
{
  echo "=== System Report ==="
  date
  echo "=== Memory ==="
  free -h
  echo "=== Disk Usage ==="
  df -h
} > system_report.txt 2> system_errors.log
```
```bash
{
  echo "=== Container Images ==="
  podman images
  echo "=== Running Containers ==="
  podman ps
} > container_report.txt 2> container_errors.log
```
✅ Conclusion

You learned to:

Redirect output using > and >>.

Chain commands using pipes |.

Handle errors using 2> and &>.

Combine techniques for advanced shell operations.

Verification:

(echo "Lab Verification"; ls /etc/passwd | wc -l; podman images 2>/dev/null | wc -l) > verification.txt


These skills are essential for automation, container management, and robust scripting in Red Hat OpenShift environments.
