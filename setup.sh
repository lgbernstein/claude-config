#!/bin/bash
# Set up ~/.claude on a new machine from the claude-config repo
#
# Run on a new Mac:
#   curl -sL https://raw.githubusercontent.com/lgbernstein/claude-config/main/setup.sh | bash
#
# Prerequisites:
#   1. git installed
#   2. Claude Code installed (npm install -g @anthropic-ai/claude-code)

set -e

TARGET="$HOME/.claude"
REPO="https://github.com/lgbernstein/claude-config.git"

echo "=== Claude Code Config Setup ==="

if [ -d "$TARGET/.git" ]; then
    echo "~/.claude already has a git repo. Pulling latest..."
    cd "$TARGET" && git pull --rebase
else
    if [ -d "$TARGET" ]; then
        echo "~/.claude exists but isn't a repo. Backing up and cloning..."
        BACKUP="$TARGET.backup.$(date +%Y%m%d)"
        mv "$TARGET" "$BACKUP"
        echo "  Backup saved to: $BACKUP"
    fi
    git clone "$REPO" "$TARGET"
fi

echo ""
echo "=== Synced files ==="
echo "  CLAUDE.md, tana-ids.md, settings.json"
echo "  commands/ (skills), hooks/, agents/, get-shit-done/"
echo "  plugins config, project memory"
echo ""
echo "=== Still needed on this machine ==="
echo "  1. settings.local.json - machine-specific permissions (auto-created by Claude Code)"
echo "  2. .config.json - MCP server config (set up Tana MCP if needed)"
echo "  3. .credentials.json - auto-created on first 'claude' login"
echo ""
echo "Done! Run 'claude' to start using Claude Code."
