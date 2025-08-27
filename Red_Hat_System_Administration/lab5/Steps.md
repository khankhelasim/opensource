# Lab 5: Steps

## Task 1: Editing Files with vim and nano
### Subtask 1.1: Create/Edit Files with vim
```bash

vim lab5_vim.txt

Insert text:

Red Hat Enterprise Linux

Text Editing Lab

Version 9.0


Save & exit: :wq

Subtask 1.2: Create/Edit Files with nano
nano lab5_nano.txt


Insert text:

Nano is a user-friendly editor.
Used for quick edits.


Save & exit: Ctrl+O → Enter → Ctrl+X

Task 2: Inline Text Replacement with sed

Subtask 2.1: Replace Text

echo -e "RHEL 8\nRHEL 9\nFedora 38" > versions.txt

sed -i 's/RHEL/Red Hat/g' versions.txt

cat versions.txt

Subtask 2.2: Delete Lines Matching Pattern

sed -i '/Fedora/d' versions.txt

cat versions.txt

Task 3: Text Processing with awk

Subtask 3.1: Extract Columns

echo -e "ID,Name,OS\n1,Alice,RHEL\n2,Bob,Fedora" > users.csv

awk -F ',' '{print $2}' users.csv

Subtask 3.2: Filter Rows

awk -F ',' '$3 == "RHEL" {print $0}' users.csv

Final Verification

ls -l lab5_*.txt versions.txt users.csv
