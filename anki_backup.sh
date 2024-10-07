#!/bin/bash

# Set the Anki backups directory path
BACKUP_DIR="$HOME/.local/share/Anki2/User 1/backups"

# Set the export directory (your GitHub repository local folder)
EXPORT_DIR="$HOME/Documents/Anki_Collection"

# Find the most recent backup file (latest .colpkg file)
LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/backup-*.colpkg | head -n 1)

# Check if a backup file was found
if [ -z "$LATEST_BACKUP" ]; then
    echo "No backup files found in $BACKUP_DIR."
    exit 1
fi

# Remove all old backup files from the export directory
echo "Removing old backup files from $EXPORT_DIR"
rm -f "$EXPORT_DIR"/backup-*.colpkg

# Copy the most recent backup to the export directory
echo "Copying $LATEST_BACKUP to $EXPORT_DIR"
cp "$LATEST_BACKUP" "$EXPORT_DIR"

# Navigate to the export directory
cd "$EXPORT_DIR"

# Add the new backup file to the git staging area
git add .

# Commit the changes with a message including the current date and time
NOW=$(date +"%Y-%m-%d %T")
git commit -m "Anki backup upload on $NOW"

# Push the changes to the GitHub repository
git push origin main

echo "Backup file successfully uploaded to GitHub."

