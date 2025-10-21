#!/bin/bash
# ===============================================
# Lab 2 - Bashrc Additions Script
# Author: Asim Rasheed
# Description: Adds aliases and functions to ~/.bashrc
# ===============================================

echo "Adding custom aliases and functions to ~/.bashrc ..."

cat << 'EOF' >> ~/.bashrc

# ---- Custom Aliases ----
alias ll='ls -alF'
alias c='clear'
alias update='sudo dnf update -y'
alias pps='podman ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"'

# ---- Custom Functions ----
function pcount() {
    podman ps -a
    echo "Total containers: \$(podman ps -a -q | wc -l)"
}

function cstate() {
    if [ "\$1" = "start" ]; then
        podman start \$2
    elif [ "\$1" = "stop" ]; then
        podman stop \$2
    else
        echo "Usage: cstate [start|stop] [container]"
    fi
}

function pclean() {
    podman container prune -f
    podman image prune -a -f
}
EOF

# Reload .bashrc
source ~/.bashrc

echo "✅ Custom aliases and functions added successfully."
