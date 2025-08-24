# Commands Used in Lab 3: Managing Files and Directories via CLI

## Task 1: Creating Files and Directories
Create directory:
```bash
mkdir lab3_files

Navigate into directory:

cd lab3_files


Create empty file:

touch notes.txt

Task 2: Copying and Moving Files

Copy file:

cp notes.txt notes_backup.txt


Create backup directory:

mkdir backup


Move file into backup:

mv notes_backup.txt backup/

Task 3: Exploring File Metadata

List with details:

ls -l


Check detailed metadata:

stat notes.txt

Task 4: Redirecting Output

Redirect output to a file:

ls -l > file_list.txt


View contents:

cat file_list.txt


Append metadata:

stat notes.txt >> file_list.txt


Verify:

cat file_list.txt

Task 5: Deleting Files and Directories

Delete file:

rm notes.txt


Delete directory and contents:

rm -r backup

