# Lab 8: Monitoring and Managing Processes

---

## Task 1: Viewing Processes with ps, top, and htop

### 1.1 List Processes with ps
```bash
ps aux

a → show processes for all users

u → display user format

x → include processes not attached to a terminal

Filter for a specific process:

ps aux | grep nginx

1.2 Monitor with top

top


Press q to quit

Press Shift + M → sort by memory

1.3 Use htop

Install if needed:

sudo apt install htop    # Ubuntu/Debian

sudo dnf install htop    # CentOS/RHEL


Run:

htop


Use arrow keys to navigate

Press F6 to sort by columns

## Task 2: Sending Signals to Processes

2.1 Kill by PID

Find process ID:

pidof firefox

# or

ps aux | grep firefox


Terminate:

kill <PID>       # graceful (SIGTERM)

kill -9 <PID>    # force (SIGKILL)

2.2 Kill by Name

pkill firefox

killall firefox

## Task 3: Job Control (jobs, fg, bg)

Start a background job:

sleep 300 &


Check jobs:

jobs


Bring to foreground:

fg %1


Pause job (Ctrl + Z), then resume in background:

bg %1


## Task 4: Adjusting Process Priority

4.1 Start with nice

nice -n 10 sleep 300 &


Range: -20 (highest priority) → 19 (lowest priority)

Default: 0

4.2 Change Priority (renice)

pgrep sleep

sudo renice -n 15 -p <PID>

Conclusion

Monitored processes with ps, top, htop

Terminated processes with kill, pkill, killall

Controlled jobs with bg, fg, jobs

Adjusted process priority with nice and renice

These are essential for system administration and troubleshooting.
