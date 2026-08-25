#!/usr/bin/env bash
###############################################################################
#
# IFAS Ecosystem
#
# Bootstrap Orchestrator
#
# Responsabilidade:
#   Executar os bootstraps de filesystem, Git e GitHub na ordem definida.
#
###############################################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"

BOOTSTRAP_SCRIPTS=(
    "filesystem.sh"
    "git.sh"
    "github.sh"
)

BOOTSTRAP_NAMES=(
    "Filesystem"
    "Git"
    "GitHub"
)

verify_scripts() {
    local script

    for script in "${BOOTSTRAP_SCRIPTS[@]}"; do
        if [[ ! -f "${SCRIPT_DIR}/${script}" ]]; then
            echo "ERROR: Required bootstrap script not found: ${script}" >&2
            exit 1
        fi

        if [[ ! -x "${SCRIPT_DIR}/${script}" ]]; then
            echo "ERROR: Required bootstrap script is not executable: ${script}" >&2
            exit 1
        fi
    done
}

run_bootstrap() {
    local index="$1"
    local script="${BOOTSTRAP_SCRIPTS[$index]}"
    local name="${BOOTSTRAP_NAMES[$index]}"
    local step=$((index + 1))
    local exit_code

    echo
    echo "[${step}/3] ${name}"
    echo "      └── ${script}"

    if bash "${SCRIPT_DIR}/${script}"; then
        return 0
    else
        exit_code=$?
    fi

    echo
    echo "ERROR: ${name} bootstrap failed." >&2
    echo "Bootstrap aborted." >&2
    return "$exit_code"
}

main() {
    local index

    cd "$ROOT_DIR"
    verify_scripts

    echo "=============================================================="
    echo " IFAS Bootstrap"
    echo "=============================================================="

    for index in "${!BOOTSTRAP_SCRIPTS[@]}"; do
        run_bootstrap "$index"
    done

    echo
    echo "=============================================================="
    echo " IFAS Bootstrap completed successfully"
    echo "=============================================================="
}

main "$@"
