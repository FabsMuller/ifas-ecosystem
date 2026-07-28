#!/usr/bin/env bash
###############################################################################
#
# IFAS Ecosystem
#
# Filesystem Bootstrap
#
# Responsabilidade:
#   Garantir que a estrutura de diretórios e arquivos do projeto exista.
#
# Características:
#   - Idempotente
#   - Nunca sobrescreve arquivos existentes
#   - Nunca remove arquivos
#   - Pode ser executado repetidamente
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
# Counters
###############################################################################

DIRECTORIES_CREATED=0
FILES_CREATED=0
ALREADY_EXISTS=0

###############################################################################
# Project Structure
###############################################################################

DIRECTORIES=(

archive

docs

ifas
ifas/architecture
ifas/architecture/adr
ifas/architecture/c4
ifas/architecture/ddd
ifas/architecture/patterns
ifas/architecture/rfc
ifas/architecture/uml

ifas/design-journal

ifas/engineering
ifas/engineering/ai-ready
ifas/engineering/metrics
ifas/engineering/reviews

ifas/knowledge-base
ifas/knowledge-base/examples
ifas/knowledge-base/glossary
ifas/knowledge-base/guides
ifas/knowledge-base/templates

ifas/manifesto
ifas/methodology

ifas/principles
ifas/principles/architecture
ifas/principles/culture
ifas/principles/documentation
ifas/principles/engineering

implementations
implementations/instantfpc
implementations/instantfpc/docs
implementations/instantfpc/docs/adr
implementations/instantfpc/docs/api
implementations/instantfpc/docs/architecture
implementations/instantfpc/docs/rfc
implementations/instantfpc/docs/tutorials
implementations/instantfpc/examples
implementations/instantfpc/packages
implementations/instantfpc/scripts
implementations/instantfpc/src
implementations/instantfpc/tests
implementations/instantfpc/tools

projects

publications
publications/articles
publications/automate-the-boring-stuff-with-pascal
publications/automate-the-boring-stuff-with-pascal/assets
publications/automate-the-boring-stuff-with-pascal/chapters
publications/automate-the-boring-stuff-with-pascal/examples
publications/automate-the-boring-stuff-with-pascal/figures
publications/automate-the-boring-stuff-with-pascal/manuscript
publications/presentations
publications/tutorials

research
research/case-studies
research/notes
research/papers
research/references

tools
tools/bootstrap
tools/dev
tools/maintenance
tools/release

validation
validation/benchmarks
validation/migrations
validation/reports

workspace
workspace/drafts
workspace/ideas
workspace/scratch
workspace/sketches
workspace/whiteboard

.github
.github/workflows
.github/ISSUE_TEMPLATE

)

FILES=(

README.md
CHANGELOG.md
LICENSE
PROJECT_STATUS.md

docs/backlog.md
docs/decisions.md
docs/meeting-notes.md
docs/releases.md
docs/roadmap.md

tools/bootstrap/README.md
tools/dev/README.md
tools/maintenance/README.md
tools/release/README.md

.github/PULL_REQUEST_TEMPLATE.md

)

###############################################################################
# Functions
###############################################################################

create_directory() {

    local dir="${ROOT_DIR}/$1"

    if [[ -d "$dir" ]]; then
        ((ALREADY_EXISTS++))
    else
        mkdir -p "$dir"
        ((DIRECTORIES_CREATED++))
        echo "  + Directory: $1"
    fi
}

create_file() {

    local file="${ROOT_DIR}/$1"

    if [[ -f "$file" ]]; then
        ((ALREADY_EXISTS++))
    else
        touch "$file"
        ((FILES_CREATED++))
        echo "  + File: $1"
    fi
}

create_directories() {

    for dir in "${DIRECTORIES[@]}"
    do
        create_directory "$dir"
    done
}

create_files() {

    for file in "${FILES[@]}"
    do
        create_file "$file"
    done
}

print_summary() {

    echo
    echo "=============================================================="
    echo " Filesystem Bootstrap Summary"
    echo "=============================================================="

    if [[ "$DIRECTORIES_CREATED" -eq 0 && "$FILES_CREATED" -eq 0 ]]; then

        echo
        echo "Project structure is already up to date."

    else

        echo
        printf "Directories created : %d\n" "$DIRECTORIES_CREATED"
        printf "Files created       : %d\n" "$FILES_CREATED"
        printf "Already existing    : %d\n" "$ALREADY_EXISTS"

    fi

    echo
}

main() {

    echo
    echo "=============================================================="
    echo " IFAS Filesystem Bootstrap"
    echo "=============================================================="
    echo

    create_directories

    create_files

    print_summary
}

main
