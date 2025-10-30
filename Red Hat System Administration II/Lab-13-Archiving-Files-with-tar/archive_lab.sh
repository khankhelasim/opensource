
---

#### 2️⃣ **archive_lab.sh**
```bash
#!/bin/bash
# Lab 13 - Archiving Files with tar
# This script automates creation, compression, and extraction steps

set -e

echo "[+] Creating sample files..."
mkdir -p lab_files
cd lab_files
echo "This is file1" > file1.txt
echo "This is file2" > file2.txt
echo "This is file3" > file3.txt

echo "[+] Creating a tar archive..."
tar -cvf archive.tar file1.txt file2.txt file3.txt

echo "[+] Listing contents of archive..."
tar -tvf archive.tar

echo "[+] Compressing with gzip..."
gzip archive.tar
ls -lh archive.tar.gz

echo "[+] Recreating tar for bzip2 compression..."
tar -cvf archive.tar file1.txt file2.txt file3.txt
bzip2 archive.tar
ls -lh archive.tar.bz2

echo "[+] Extracting .tar.gz file..."
tar -xzvf archive.tar.gz

echo "[+] Extracting .tar.bz2 file..."
tar -xjvf archive.tar.bz2

echo "[✓] Lab 13 completed successfully!"
