#!/usr/bin/env bash
###############################################################################
#
# IFAS Ecosystem
#
# Repository Layout Update v1.1
#
# Objetivo:
#   Complementar a estrutura oficial do repositório.
#
# Uso:
#   Execute a partir da raiz do repositório:
#
#       ./tools/bootstrap/update-structure-v1.1.sh
#
###############################################################################

set -euo pipefail

echo
echo "=============================================================="
echo " IFAS Repository Layout Update v1.1"
echo "=============================================================="
echo

###############################################################################
# Verificação
###############################################################################

if [[ ! -f "README.md" ]]; then
    echo "ERRO: Execute este script na raiz do repositório."
    exit 1
fi

###############################################################################
# Tools
###############################################################################

echo "Creating tools structure..."

mkdir -p tools/bootstrap
mkdir -p tools/dev
mkdir -p tools/release
mkdir -p tools/maintenance

###############################################################################
# GitHub
###############################################################################

echo "Creating GitHub structure..."

mkdir -p .github

mkdir -p .github/workflows
mkdir -p .github/ISSUE_TEMPLATE

touch .github/PULL_REQUEST_TEMPLATE.md

###############################################################################
# READMEs (opcional)
###############################################################################

touch tools/bootstrap/README.md
touch tools/dev/README.md
touch tools/release/README.md
touch tools/maintenance/README.md

###############################################################################
# Final
###############################################################################

echo
echo "=============================================================="
echo " Repository updated successfully."
echo "=============================================================="
echo

if command -v tree >/dev/null 2>&1; then
    tree tools .github
else
    find tools .github | sort
fi

echo
echo "Done."
