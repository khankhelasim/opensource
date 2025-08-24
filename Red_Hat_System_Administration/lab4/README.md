# Lab 4: Accessing Local Help and Documentation

## Objectives
By the end of this lab, I was able to:
- Utilize local help resources to troubleshoot and learn Linux commands.
- Navigate manual pages (`man`) and info pages (`info`).
- Use command-line help flags (`--help`).
- Explore system documentation in `/usr/share/doc`.
- Employ `whatis` and `apropos` for command discovery.
- Examine package information using `yum`/`dnf`.

## Prerequisites
- Linux system (RHEL, Fedora, or CentOS).
- Terminal access with standard user privileges.
- Basic familiarity with command-line operations.
- Podman installed (for testing container documentation).

---

## Tasks Completed

### Task 1: Using Manual Pages (`man`)
- Opened `man ls` to explore the ls documentation.
- Navigated with space, `b`, `/search`, and `q`.
- Viewed sectioned manual pages with `man 5 passwd`.

### Task 2: Using Info Pages (`info`)
- Accessed GNU utilities with `info coreutils`.
- Navigated with `n`, `p`, `u`, and `q`.

### Task 3: Using `--help` Flag
- Tested quick help with:
  - `ls --help`
  - `podman --help`
  - `podman run --help`

### Task 4: Exploring `/usr/share/doc`
- Listed documentation with `ls /usr/share/doc`.
- Viewed Bash README with `less /usr/share/doc/bash/README`.

### Task 5: Using `whatis` and `apropos`
- Checked command purpose with `whatis ls` and `whatis podman`.
- Searched related tools with:
  - `apropos "list directory"`
  - `apropos container`

### Task 6: Examining Package Information
- Verified Podman installation with `dnf list installed podman`.
- Viewed package info with `dnf info podman`.
- Viewed changelog with `dnf changelog podman`.

---

## Key Learnings
- `man` is the most detailed source of command documentation.
- `info` provides hierarchical navigation for GNU utilities.
- `--help` gives quick syntax and options.
- `/usr/share/doc` contains package-specific extra documentation.
- `whatis` gives one-line descriptions, `apropos` helps discover commands by keywords.
- `dnf info` and `dnf changelog` provide metadata and update history.

---

## Next Steps
- Explore more man page sections (`man man`).
- Combine `man` or `info` with `grep` for faster searches.
- Use `apropos network` to list all network-related tools.
- Check what the `-a` flag does for `ls` via documentation.

---

## Completion Checklist
✅ Used `man` and `info`  
✅ Tested `--help` on commands  
✅ Explored `/usr/share/doc`  
✅ Practiced `whatis` and `apropos`  
✅ Verified package info with `dnf`  

