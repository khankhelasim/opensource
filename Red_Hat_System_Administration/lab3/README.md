# Lab 3: Managing Files and Directories via CLI

## Objectives
By the end of this lab, I was able to:
- Create, move, copy, and delete files and directories using CLI commands.
- Explore file metadata using `ls -l` and `stat`.
- Redirect command output using `>` and `>>`.

## Prerequisites
- A Linux-based system (Fedora, Ubuntu, or RHEL).
- Terminal access with standard user privileges.
- Basic familiarity with CLI navigation.

## Tasks Completed

### Task 1: Creating Files and Directories
- Created a directory `lab3_files` using `mkdir`.
- Created an empty file `notes.txt` inside it with `touch`.

### Task 2: Copying and Moving Files
- Copied `notes.txt` to `notes_backup.txt` using `cp`.
- Created a `backup/` directory and moved `notes_backup.txt` inside it with `mv`.

### Task 3: Exploring File Metadata
- Used `ls -l` to view permissions, ownership, and size.
- Used `stat` on `notes.txt` to view inode and timestamps.

### Task 4: Redirecting Output
- Redirected `ls -l` output to `file_list.txt`.
- Appended `stat notes.txt` output to the same file with `>>`.

### Task 5: Deleting Files and Directories
- Removed `notes.txt` using `rm`.
- Removed the `backup` directory and its contents with `rm -r`.

## Key Learnings
- Mastered file and directory management with basic commands.
- Understood file metadata (permissions, ownership, inode, timestamps).
- Practiced output redirection and appending results to files.
- Learned to carefully use `rm -r` to avoid accidental data loss.

## Next Steps
- Practice with more `ls` flags (`-a`, `-lh`, `-R`).
- Use `cp -i` and `rm -i` to add safety when overwriting or deleting files.

## Completion Checklist
✅ Created files and directories  
✅ Copied and moved files  
✅ Viewed file metadata  
✅ Redirected output  
✅ Deleted files and directories  

