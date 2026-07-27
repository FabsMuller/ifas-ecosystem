#!/usr/bin/env bash

gh repo view >/dev/null || {
    echo "Repository not found."
    exit 1
}
set -e

cd "$(dirname "$0")"

./check-prerequisites.sh

source config.sh

echo
echo "======================================"
echo " IFAS GitHub Bootstrap"
echo "======================================"

./create-labels.sh

./create-milestones.sh

./create-issues.sh

echo
echo "Bootstrap completed."
