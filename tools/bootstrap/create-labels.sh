#!/usr/bin/env bash

set -e

source config.sh

echo
echo "Creating labels..."

create_label() {

    gh label create "$1" \
        --repo "$OWNER/$REPO" \
        --color "$2" \
        --description "$3" \
        2>/dev/null || true
}

create_label "ADR" "0052CC" "Architecture Decision Record"

create_label "RFC" "5319E7" "Request For Comments"

create_label "DJ" "1D76DB" "Design Journal"

create_label "Research" "FBCA04" "Research"

create_label "Implementation" "0E8A16" "Implementation"

create_label "Validation" "B60205" "Validation"

create_label "Book" "6F42C1" "Publication"

create_label "IFAS" "D93F0B" "Methodology"

create_label "High Priority" "B60205" "High priority"

create_label "Medium Priority" "FBCA04" "Medium priority"

create_label "Low Priority" "0E8A16" "Low priority"

echo "Done."
