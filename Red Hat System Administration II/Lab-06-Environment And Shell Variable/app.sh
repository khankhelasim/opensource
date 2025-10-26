#!/bin/bash
source config.cfg

echo "Running with:"
echo "Retries: $MAX_RETRIES"
echo "Log Level: $LOG_LEVEL"
mkdir -p $BACKUP_DIR
