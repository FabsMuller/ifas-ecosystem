#!/usr/bin/env bash
###############################################################################
#
# IFAS Ecosystem
#
# Git Bootstrap
#
# Responsabilidade:
#   Garantir que o repositório Git local esteja inicializado e em condições
#   básicas de uso.
#
# Características:
#   - Idempotente
#   - Não executa commit
#   - Não executa push
#   - Não modifica identidade do usuário
#   - Não configura o remote
#   - Não executa operações destrutivas
#
###############################################################################

set -euo pipefail

###############################################################################
# Paths
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"

###############################################################################
# Configuration
###############################################################################

source "${SCRIPT_DIR}/config.sh"

###############################################################################
# State
###############################################################################

GIT_VERSION=""
REPOSITORY_STATUS=""
BRANCH_NAME=""
REMOTE_STATUS=""
IDENTITY_STATUS=""
REPOSITORY_INITIALIZED=false

###############################################################################
# Functions
###############################################################################

check_git() {

    if ! command -v git >/dev/null 2>&1; then
        echo "ERROR: Git is not installed."
        exit 1
    fi

    GIT_VERSION="$(git --version)"
}

check_repository() {

    if git -C "$ROOT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        REPOSITORY_STATUS="already initialized"
        REPOSITORY_INITIALIZED=true
    else
        REPOSITORY_STATUS="not initialized"
    fi
}

initialize_repository() {

    if [[ "$REPOSITORY_INITIALIZED" == true ]]; then
        return
    fi

    echo "Initializing Git repository..."

    if git -C "$ROOT_DIR" init -b "$DEFAULT_BRANCH" >/dev/null 2>&1; then
        :
    else
        git -C "$ROOT_DIR" init >/dev/null

        git -C "$ROOT_DIR" symbolic-ref HEAD \
            "refs/heads/${DEFAULT_BRANCH}"
    fi

    REPOSITORY_STATUS="initialized"
    REPOSITORY_INITIALIZED=true
}

check_branch() {

    if [[ "$REPOSITORY_INITIALIZED" != true ]]; then
        return
    fi

    if git -C "$ROOT_DIR" symbolic-ref --quiet --short HEAD >/dev/null 2>&1; then
        BRANCH_NAME="$(
            git -C "$ROOT_DIR" symbolic-ref --quiet --short HEAD
        )"
    else
        BRANCH_NAME="detached HEAD"
    fi
}

check_remote() {

    if git -C "$ROOT_DIR" remote get-url origin >/dev/null 2>&1; then
        REMOTE_STATUS="origin configured"
    else
        REMOTE_STATUS="not configured"
    fi
}

check_identity() {

    local user_name=""
    local user_email=""

    user_name="$(
        git -C "$ROOT_DIR" config --get user.name 2>/dev/null || true
    )

    user_email="$(
        git -C "$ROOT_DIR" config --get user.email 2>/dev/null || true
    )

    if [[ -n "$user_name" && -n "$user_email" ]]; then
        IDENTITY_STATUS="configured"
    else
        IDENTITY_STATUS="not configured"
    fi
}

print_summary() {

    echo
    echo "=============================================================="
    echo " IFAS Git Bootstrap"
    echo "=============================================================="
    echo

    printf "Git                 : %s\n" "$GIT_VERSION"
    printf "Repository          : %s\n" "$REPOSITORY_STATUS"
    printf "Branch              : %s\n" "${BRANCH_NAME:-unknown}"
    printf "Remote              : %s\n" "$REMOTE_STATUS"
    printf "User identity       : %s\n" "$IDENTITY_STATUS"

    echo

    if [[ "$REPOSITORY_STATUS" == "already initialized" ]]; then
        echo "No changes necessary."
    else
        echo "Git bootstrap completed successfully."
    fi

    echo
}

main() {

    check_git

    check_repository

    initialize_repository

    check_branch

    check_remote

    check_identity

    print_summary
}

main "$@"
