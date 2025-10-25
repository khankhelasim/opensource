# Lab 5: Job Control

## 🎯 Objectives
- Understand job control concepts in Linux process management  
- Learn to manage background and foreground processes  
- Master job control commands: `&`, `jobs`, `fg`, `bg`, and `kill`  
- Develop skills for efficient process management in terminal sessions  

---

## 🧩 Prerequisites
- Linux terminal (Bash shell)  
- Basic understanding of Linux commands  
- A text editor (nano/vim)  
- System with **Podman** installed (for container examples)  

---

## ⚙️ Lab Setup
```bash
echo $SHELL
Expected Output:

/bin/bash


Create a clean working directory:

mkdir job_control_lab && cd job_control_lab

🧠 Task 1: Starting Background Processes
🔹 Subtask 1.1: Launch a Process in Background
sleep 300 &


💡 The & symbol runs the command in the background.

Expected Output:

[1] 12345  # [job_number] PID

🔹 Subtask 1.2: Verify Background Job
jobs


Expected Output:

[1]+  Running                 sleep 300 &


📘 Key Concept:
jobs lists all background jobs in the current shell session.

🧠 Task 2: Managing Job States
🔹 Subtask 2.1: Bring Job to Foreground
fg %1


The process now runs in foreground.
Suspend it with Ctrl+Z.

🔹 Subtask 2.2: Move Job to Background
bg %1
jobs


💡 If you see “no job control”, ensure you’re using Bash and not a restricted shell.

🧠 Task 3: Process Termination
🔹 Subtask 3.1: Graceful Termination

List jobs with PIDs:

jobs -l


Then send a TERM signal:

kill <PID>

🔹 Subtask 3.2: Force Termination

For unresponsive processes:

kill -9 <PID>

🔹 Subtask 3.3: Verify Termination
jobs


Expected output should show “Terminated” or no job listing.

⚙️ Advanced Task: Job Control with Containers

Start a Podman container in background:

podman run -d --name lab_nginx nginx


List running containers:

podman ps


Stop the container:

podman stop lab_nginx

🏁 Conclusion

You’ve learned essential job control techniques:

Started and managed background processes

Switched jobs between foreground and background

Terminated processes gracefully or forcefully

Applied job control concepts to container management
