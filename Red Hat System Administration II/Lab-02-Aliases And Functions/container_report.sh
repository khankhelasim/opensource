#!/bin/bash
# ===============================================
# Lab 2 - Container Report Script
# Author: Asim Rasheed
# Description: Generates container report using Podman
# ===============================================

# Function to display Podman container status and disk usage
function container_report() {
    echo "==============================================="
    echo "           Podman Container Report"
    echo "==============================================="
    pps
    echo
    echo "==============================================="
    echo "           Disk Usage Summary"
    echo "==============================================="
    podman system df
}

# Run the report function
container_report
