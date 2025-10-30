#!/bin/bash
# Archive and compress .log files in /var/log

LOG_DIR="/var/log"
OUTPUT_FILE="logs_archive_$(date +%F).tar.gz"

echo "[+] Archiving and compressing log files..."
tar -czvf $OUTPUT_FILE $LOG_DIR/*.log

echo "[✓] Logs archived successfully: $OUTPUT_FILE"
