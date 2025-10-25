# Notes: Lab 5 – Job Control

## 🔍 Concepts
1. **Foreground vs Background**
   - Foreground: process occupies the terminal until it finishes.
   - Background: process runs independently while terminal remains free.

2. **Key Commands**
   | Command | Description |
   |----------|-------------|
   | `&` | Runs a process in background |
   | `jobs` | Lists active background jobs |
   | `fg %1` | Brings job 1 to foreground |
   | `bg %1` | Resumes a suspended job in background |
   | `kill <PID>` | Sends a termination signal |
   | `kill -9 <PID>` | Forces process termination |

3. **Signals**
   - `SIGTERM (15)` → Graceful stop  
   - `SIGKILL (9)` → Force stop  
   - `SIGSTOP` → Pause/suspend  
   - `SIGCONT` → Resume

4. **Suspending Jobs**
   - Press `Ctrl+Z` → Suspends a running foreground job  
   - Then use `bg` or `fg` to resume it.

5. **With Containers**
   - `podman run -d` runs containers detached (in background).  
   - `podman ps` lists them, `podman stop` gracefully terminates them.

## ⚡ Pro Tips
- Use `jobs -l` to see both job numbers and PIDs.  
- Combine with `ps aux | grep <process>` for verification.  
- Avoid using `kill -9` unless necessary — it skips cleanup.

## ✅ Summary
You now understand:
- Foreground/background job control  
- Managing processes via job IDs and PIDs  
- Graceful and forceful terminations  
- Container-level process management using Podman
