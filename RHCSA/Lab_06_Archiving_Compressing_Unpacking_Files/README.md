# Lab 6: Archiving, Compressing, and Unpacking Files

## 🎯 Objectives
By the end of this lab, you will be able to:
- Create archives using `tar`
- Compress files using `gzip` and `bzip2`
- Extract and decompress archived files
- Combine and compress multiple files for efficient storage or transfer

## 🧰 Prerequisites
- Linux system (Ubuntu/CentOS/RHEL)
- Packages: `tar`, `gzip`, `bzip2`
- Verify installation:
  ```bash
  tar --version
  gzip --version
  bzip2 --version
  ```
## 🧪 Lab Tasks

### Task 1: Creating Archives with tar
```bash
mkdir lab_files
cd lab_files
touch file1.txt file2.txt file3.txt
echo "This is file1" > file1.txt
echo "This is file2" > file2.txt
echo "This is file3" > file3.txt

# Create archive
tar -cvf archive.tar file1.txt file2.txt file3.txt
# View contents
tar -tvf archive.tar
```
### Task 2: Compressing Files
Using gzip
```bash
gzip archive.tar
ls -lh archive.tar.gz
```
Using bzip2
```bash
tar -cvf archive.tar file1.txt file2.txt file3.txt
bzip2 archive.tar
```
### Task 3: Extracting Files
Extract .tar.gz
```bash
gunzip archive.tar.gz
tar -xvf archive.tar
```
Extract .tar.bz2
```bash
bunzip2 archive.tar.bz2
tar -xvf archive.tar
```
### Task 4: Combine and Compress in One Step
```bash
tar -czvf combined.tar.gz file1.txt file2.txt file3.txt
tar -cjvf combined.tar.bz2 file1.txt file2.txt file3.txt
```
🧩 Troubleshooting

No such file: Verify files exist.

Permission denied: Use sudo.

Check archive integrity: tar -tvf archive.tar.

✅ Conclusion

In this lab, you learned to:

Create and extract tar archives

Compress with gzip/bzip2

Combine multiple files into compressed archives

These skills are essential for daily Linux operations and managing backups efficiently.
