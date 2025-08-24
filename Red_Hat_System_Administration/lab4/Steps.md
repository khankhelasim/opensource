# Commands Used in Lab 4: Accessing Local Help and Documentation

## Task 1: Manual Pages
```bash
man ls

man 5 passwd

Task 2: Info Pages

info coreutils

Task 3: Help Flags

ls --help

podman --help

podman run --help

Task 4: /usr/share/doc

ls /usr/share/doc

less /usr/share/doc/bash/README

Task 5: whatis and apropos

whatis ls

whatis podman

apropos "list directory"

apropos container

Task 6: Package Information

dnf list installed podman

dnf info podman

dnf changelog podman
