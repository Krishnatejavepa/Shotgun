#!/bin/bash
# Shotgun Global Installer
# Run this once from the Shotgun repository to enable the `shotgun-init` command globally.

REPO_DIR=$(pwd)

if [ ! -f "$REPO_DIR/SHOTGUN.md" ]; then
    echo "Error: You must run this script from the root of the Shotgun repository."
    exit 1
fi

ALIAS_CMD="alias shotgun-init='cp -r \"$REPO_DIR/.shotgun\" . && cp \"$REPO_DIR/SHOTGUN.md\" . && mkdir -p memory vault && echo \"✅ Shotgun OS initialized in \$(pwd). Boot your agent.\"' "

if [[ "$SHELL" == *"zsh"* ]]; then
    echo "$ALIAS_CMD" >> ~/.zshrc
    echo "✅ Added shotgun-init to ~/.zshrc."
    echo "👉 Run 'source ~/.zshrc' or open a new terminal, then type 'shotgun-init' in any project folder."
else
    echo "$ALIAS_CMD" >> ~/.bashrc
    echo "✅ Added shotgun-init to ~/.bashrc."
    echo "👉 Run 'source ~/.bashrc' or open a new terminal, then type 'shotgun-init' in any project folder."
fi
