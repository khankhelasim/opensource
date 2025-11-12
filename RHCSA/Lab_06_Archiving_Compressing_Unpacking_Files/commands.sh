
---

### 💻 **commands.sh**
```bash
#!/bin/bash
# Lab 6 - Archiving, Compressing, and Unpacking Files

# Task 1: Create sample files
mkdir lab_files
cd lab_files
touch file1.txt file2.txt file3.txt
echo "This is file1" > file1.txt
echo "This is file2" > file2.txt
echo "This is file3" > file3.txt

# Create tar archive
tar -cvf archive.tar file1.txt file2.txt file3.txt
tar -tvf archive.tar

# Compress with gzip
gzip archive.tar
ls -lh archive.tar.gz

# Compress with bzip2
tar -cvf archive.tar file1.txt file2.txt file3.txt
bzip2 archive.tar

# Extract .tar.gz
gunzip archive.tar.gz
tar -xvf archive.tar

# Extract .tar.bz2
bunzip2 archive.tar.bz2
tar -xvf archive.tar

# Combine and compress directly
tar -czvf combined.tar.gz file1.txt file2.txt file3.txt
tar -cjvf combined.tar.bz2 file1.txt file2.txt file3.txt
