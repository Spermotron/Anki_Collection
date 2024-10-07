#!/bin/bash

# Set the directory where the Anki collection will be exported
EXPORT_DIR="/home/YourUsername/Documents/AnkiExports"

# Set the Anki collection file path (modify this if your path is different)
ANKI_PROFILE_DIR="/home/YourUsername/Anki2/YourProfile"

# Export the Anki collection (all decks and media)
echo "Exporting Anki collection to $EXPORT_DIR"
cp "$ANKI_PROFILE_DIR/collection.anki2" "$EXPORT_DIR/anki_collection_backup.apkg"

# Navigate to the export directory
cd $EXPORT_DIR

# Add all new or modified files in AnkiExports
git add .

# Commit the changes with a message including the date and time
NOW=$(date +"%Y-%m-%d %T")
git commit -m "Anki collection backup on $NOW"

# Push the changes to GitHub
git push origin main

echo "Backup and GitHub push completed successfully."

