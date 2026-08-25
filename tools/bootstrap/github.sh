#!/usr/bin/env bash
###############################################################################
#
# IFAS Ecosystem
#
# GitHub Bootstrap
#
# Responsabilidade:
#   Garantir a configuração básica do repositório no GitHub.
#
# Características:
#   - Idempotente
#   - Não executa commit ou push
#   - Não cria Issues ou GitHub Projects
#   - Não remove recursos
#
###############################################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"

source "${SCRIPT_DIR}/config.sh"

REPOSITORY_SLUG="${GITHUB_OWNER}/${GITHUB_REPOSITORY}"

check_github_cli() {
    if ! command -v gh >/dev/null 2>&1; then
        echo "ERROR: GitHub CLI is not installed."
        exit 1
    fi
}

check_github_authentication() {
    if ! gh auth status >/dev/null 2>&1; then
        echo "ERROR: GitHub CLI is not authenticated."
        echo "Run: gh auth login"
        exit 1
    fi
}

ensure_repository() {
    if gh repo view "$REPOSITORY_SLUG" >/dev/null 2>&1; then
        echo "GitHub repository already exists: $REPOSITORY_SLUG"
        return
    fi

    echo "Creating GitHub repository: $REPOSITORY_SLUG"
    gh repo create "$REPOSITORY_SLUG" --"$GITHUB_VISIBILITY"
}

ensure_remote() {
    if git -C "$ROOT_DIR" remote get-url "$GITHUB_REMOTE_NAME" \
        >/dev/null 2>&1; then
        echo "Git remote already configured: $GITHUB_REMOTE_NAME"
        return
    fi

    local remote_url="git@github.com:${REPOSITORY_SLUG}.git"

    echo "Configuring Git remote: $GITHUB_REMOTE_NAME"
    git -C "$ROOT_DIR" remote add "$GITHUB_REMOTE_NAME" "$remote_url"
}

ensure_label() {
    local name="$1"
    local color="$2"
    local description="$3"

    if gh label list --repo "$REPOSITORY_SLUG" --limit 100 \
        --json name --jq '.[].name' 2>/dev/null | grep -Fxq "$name"; then
        echo "Label already exists: $name"
        return
    fi

    echo "Creating label: $name"
    gh label create "$name" --repo "$REPOSITORY_SLUG" \
        --color "$color" --description "$description"
}

ensure_labels() {
    ensure_label "ADR" "$LABEL_COLOR_ADR" "Architecture Decision Record"
    ensure_label "RFC" "$LABEL_COLOR_RFC" "Request For Comments"
    ensure_label "DJ" "$LABEL_COLOR_DJ" "Design Journal"
    ensure_label "Research" "$LABEL_COLOR_RESEARCH" "Research"
    ensure_label "Implementation" "$LABEL_COLOR_IMPLEMENTATION" "Implementation"
    ensure_label "Validation" "$LABEL_COLOR_VALIDATION" "Validation"
    ensure_label "Book" "$LABEL_COLOR_BOOK" "Publication"
    ensure_label "IFAS" "$LABEL_COLOR_IFAS" "Methodology"
}

ensure_milestone() {
    local title="$1"

    if gh api "repos/${REPOSITORY_SLUG}/milestones" \
        --paginate --jq '.[].title' 2>/dev/null | grep -Fxq "$title"; then
        echo "Milestone already exists: $title"
        return
    fi

    echo "Creating milestone: $title"
    gh api --method POST "repos/${REPOSITORY_SLUG}/milestones" \
        -f title="$title" >/dev/null
}

ensure_milestones() {
    local milestone

    for milestone in "${MILESTONES[@]}"; do
        ensure_milestone "$milestone"
    done
}

main() {
    check_github_cli
    check_github_authentication
    ensure_repository
    ensure_remote
    ensure_labels
    ensure_milestones

    echo "GitHub bootstrap completed successfully."
}

main "$@"
