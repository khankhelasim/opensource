# === Bash History Enhancements ===
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
HISTCONTROL=ignoreboth

# === History Search Aliases ===
alias hs='history | grep --color=auto'
alias hsi='history | grep -i --color=auto'

# === Frequent Commands Summary Function ===
function hst {
  history | awk '{print $2 " " $3 "\t" $4 "\t" $5FS$6FS$7FS$8FS$9FS$10}' | sort | uniq -c | sort -nr | head -n 20
}
