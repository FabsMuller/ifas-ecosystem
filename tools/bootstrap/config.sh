#!/usr/bin/env bash
###############################################################################
#
# IFAS Ecosystem
#
# Bootstrap Configuration
#
# Version : 1.0
#
###############################################################################

set -euo pipefail

###############################################################################
# Project
###############################################################################

PROJECT_NAME="ifas-ecosystem"

###############################################################################
# Git
###############################################################################

DEFAULT_BRANCH="main"

INITIAL_COMMIT_MESSAGE="chore: establish IFAS repository layout v1.0"

###############################################################################
# GitHub
###############################################################################

# GitHub username or organization
GITHUB_OWNER="FabsMuller"

# Repository name
GITHUB_REPOSITORY="$PROJECT_NAME"

# Project visibility
GITHUB_VISIBILITY="public"

# Git remote name
GITHUB_REMOTE_NAME="origin"

###############################################################################
# GitHub Project
###############################################################################

PROJECT_BOARD_NAME="IFAS Roadmap"

###############################################################################
# Colors (GitHub Labels)
###############################################################################

LABEL_COLOR_ADR="0052CC"
LABEL_COLOR_RFC="5319E7"
LABEL_COLOR_DJ="1D76DB"
LABEL_COLOR_RESEARCH="FBCA04"
LABEL_COLOR_IMPLEMENTATION="0E8A16"
LABEL_COLOR_VALIDATION="B60205"
LABEL_COLOR_BOOK="6F42C1"
LABEL_COLOR_IFAS="D93F0B"

###############################################################################
# Milestones
###############################################################################

MILESTONES=(
    "M1 - Fundação do IFAS"
    "M2 - Metodologia Consolidada"
    "M3 - Arquitetura InstantFPC"
    "M4 - MVP"
    "M5 - Livro"
    "M6 - Validation"
    "M7 - Release 1.0"
)
