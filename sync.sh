#!/bin/bash
# Quick sync for ~/.claude config across machines
# Usage: ~/.claude/sync.sh          (pull latest, then push changes)
#        ~/.claude/sync.sh pull      (pull only)
#        ~/.claude/sync.sh push      (push only)
#        ~/.claude/sync.sh status    (show what's changed)

set -e
cd "$HOME/.claude"

case "${1:-sync}" in
    pull)
        echo "Pulling latest config..."
        git pull --rebase
        echo "Done."
        ;;
    push)
        echo "Pushing config changes..."
        git add -A
        CHANGES=$(git diff --cached --stat)
        if [ -z "$CHANGES" ]; then
            echo "Nothing to push."
        else
            git commit -m "Sync from $(hostname -s) on $(date +%Y-%m-%d)"
            git push
            echo "Done."
        fi
        ;;
    status)
        git status --short
        ;;
    sync|"")
        echo "Pulling latest..."
        git stash --quiet 2>/dev/null || true
        git pull --rebase
        git stash pop --quiet 2>/dev/null || true
        echo "Pushing local changes..."
        git add -A
        CHANGES=$(git diff --cached --stat)
        if [ -z "$CHANGES" ]; then
            echo "Already in sync."
        else
            git commit -m "Sync from $(hostname -s) on $(date +%Y-%m-%d)"
            git push
            echo "Synced."
        fi
        ;;
    *)
        echo "Usage: sync.sh [pull|push|status|sync]"
        exit 1
        ;;
esac
