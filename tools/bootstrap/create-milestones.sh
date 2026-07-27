#!/usr/bin/env bash

set -e

source config.sh

echo
echo "Creating milestones..."

create_ms(){

gh api \
repos/$OWNER/$REPO/milestones \
-f title="$1" \
2>/dev/null || true

}

create_ms "M1 - Fundação do IFAS"

create_ms "M2 - Metodologia Consolidada"

create_ms "M3 - Arquitetura InstantFPC"

create_ms "M4 - MVP"

create_ms "M5 - Livro"

create_ms "M6 - Validation"

create_ms "M7 - Release 1.0"

echo "Done."
