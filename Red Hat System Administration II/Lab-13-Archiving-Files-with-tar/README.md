# Lab 13: Archiving Files with tar

## 🎯 Objectives
By the end of this lab, you will be able to:
- Combine and compress multiple files into a single archive
- Use `tar`, `gzip`, and `bzip2` for archiving and compression
- Extract and list files from `.tar`, `.tar.gz`, and `.tar.bz2` archives

---

## 🧰 Prerequisites
- A Linux-based system (Ubuntu, CentOS, Fedora, etc.)
- Basic command-line knowledge
- Ensure `tar`, `gzip`, and `bzip2` are installed  
  *(They are pre-installed on most Linux systems)*

---

## 🧩 Task 1: Create a Tarball with tar to Archive Files

### Step 1.1 — Create Sample Files
```bash
mkdir lab_files
cd lab_files
touch file1.txt file2.txt file3.txt
echo "This is file1" > file1.txt
echo "This is file2" > file2.txt
echo "This is file3" > file3.txt
```
✅ Three text files (file1.txt, file2.txt, file3.txt) are created.

Step 1.2 — Create a .tar Archive
```bash
tar -cvf archive.tar file1.txt file2.txt file3.txt
```
Options:

-c → Create a new archive

-v → Verbose (show files being archived)

-f → Specify archive filename

✅ A file named archive.tar is created containing all three files.

Step 1.3 — Verify the Archive
```bash
tar -tvf archive.tar
```

✅ Lists the contents of archive.tar.

🧩 Task 2: Compress the Tarball with gzip or bzip2

Step 2.1 — Compress with gzip
```bash
gzip archive.tar
```
✅ Creates a compressed file named archive.tar.gz.

Verify:
```bash
ls -lh archive.tar.gz
```
Step 2.2 — Compress with bzip2 (Alternative)

Recreate the tar file (gzip modifies it):
```bash
tar -cvf archive.tar file1.txt file2.txt file3.txt
```
Now compress with bzip2:
```bash
bzip2 archive.tar
```

✅ Creates a file named archive.tar.bz2.

Compare file sizes:
```bash
ls -lh archive.tar.*
```
🧩 Task 3: Extract and List Files from an Existing Tar Archive

Step 3.1 — Extract a .tar Archive
```bash
tar -xvf archive.tar
```
✅ Extracts file1.txt, file2.txt, and file3.txt.

Step 3.2 — Extract a .tar.gz Archive
```bash
tar -xzvf archive.tar.gz
```
Option: -z → Use gzip for decompression

✅ Files extracted successfully.

Step 3.3 — Extract a .tar.bz2 Archive
```bash
tar -xjvf archive.tar.bz2
```

Option: -j → Use bzip2 for decompression

✅ Files extracted successfully.

⚙️ Troubleshooting Tips

Issue	Solution

No such file or directory	Ensure files exist before archiving

Permission denied	Use sudo or check with ls -l

Corrupt archive	Recreate the archive

🏁 Conclusion

✅ You have learned how to:

Create .tar archives

Compress archives with gzip and bzip2

Extract and verify files from compressed and uncompressed archives

Archiving and compression are vital for efficient file management — especially in environments like Red Hat OpenShift, where container images and logs are often bundled and transferred.

🧠 Additional Practice (Optional)

Create nested directory structures and archive them

Test different compression levels (gzip -9 for maximum compression)

Automate archiving with shell scripts

Make a Sample automation script file
```bash
#!/bin/bash
# Archive and compress .log files in a directory
tar -czvf logs_archive.tar.gz /var/log/*.log
echo "Logs archived and compressed!"
```
