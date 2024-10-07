#!/bin/bash

# Export Anki deck to the specified folder
anki --export ~/Documents/AnkiExports/my_anki_deck.apkg

# Git commands to commit and push the exported deck
cd ~/Documents/AnkiExports
git add *.apkg
git commit -m "Automated export and backup of Anki deck"
git push origin main
