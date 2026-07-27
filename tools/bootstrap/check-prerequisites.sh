#!/usr/bin/env bash

set -e

echo "Checking prerequisites..."

command -v gh >/dev/null || {
    echo "GitHub CLI not installed."
    exit 1
}

gh auth status >/dev/null || {
    echo "You must login first:"
    echo
    echo "    gh auth login"
    exit 1
}

echo "OK"
