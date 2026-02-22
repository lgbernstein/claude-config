#!/bin/bash
# Clone claude-config to ~/.claude on a new machine
# Run: curl -sL https://raw.githubusercontent.com/lgbernstein/claude-config/main/setup.sh | bash
#
# Prerequisites:
#   1. SSH key added to GitHub (github.com/settings/keys)
#   2. git installed

set -e

TARGET="$HOME/.claude"

if [ -d "$TARGET/.git" ]; then
    echo "~/.claude already has a git repo. Pulling latest..."
    cd "$TARGET" && git pull
else
    if [ -d "$TARGET" ]; then
        echo "~/.claude exists but isn't a repo. Backing up and cloning..."
        mv "$TARGET" "$TARGET.backup.$(date +%Y%m%d)"
    fi
    git clone git@github.com:lgbernstein/claude-config.git "$TARGET"
fi

echo "Done! ~/.claude is synced."
