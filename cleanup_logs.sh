#!/bin/bash

# Exit immediately if something fails
set -e

# Check if directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

TARGET_DIR="$1"

# Verify directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory does not exist: $TARGET_DIR"
    exit 1
fi

echo "Cleaning up .log files older than 7 days in: $TARGET_DIR"

# Find and delete .log files older than 7 days
find "$TARGET_DIR" -type f -name "*.log" -mtime +7 -print -delete

echo "Cleanup completed."
