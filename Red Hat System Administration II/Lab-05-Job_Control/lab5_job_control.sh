
---

### ⚙️ `lab5_job_control.sh`
```bash
#!/bin/bash
# Lab 5: Job Control
# Author: Asim Rasheed
# Description: Demonstrates Linux job control operations including fg, bg, jobs, and kill.

echo "===== Lab 5: Job Control ====="

# Setup
mkdir -p job_control_lab
cd job_control_lab || exit

echo "---- Verifying shell ----"
echo "Your shell is: $SHELL"

echo "---- Task 1: Starting Background Processes ----"
echo "Launching a background process..."
sleep 300 &
echo "Process launched in background with job ID and PID:"
jobs

echo "---- Task 2: Managing Job States ----"
echo "Bringing job to foreground..."
fg %1 &
sleep 1

echo "Suspending process (simulating Ctrl+Z)..."
kill -STOP %1 2>/dev/null

echo "Resuming job in background..."
bg %1 2>/dev/null
jobs

echo "---- Task 3: Process Termination ----"
echo "Listing jobs with PIDs:"
jobs -l

PID=$(jobs -l | awk '{print $2}' | head -n 1)
if [ -n "$PID" ]; then
  echo "Attempting graceful termination for PID: $PID"
  kill "$PID"
  sleep 1
  echo "Verifying termination:"
  jobs
else
  echo "No active PID found."
fi

echo "---- Advanced Task: Job Control with Containers ----"
echo "Starting Podman container in background..."
podman run -d --name lab_nginx nginx >/dev/null 2>&1

echo "Listing running containers:"
podman ps

echo "Stopping the container..."
podman stop lab_nginx >/dev/null 2>&1

echo "Container stopped successfully."

echo "===== Lab 5 Complete! ====="
