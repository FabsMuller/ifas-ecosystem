#!/usr/bin/env bash

set -e

source config.sh

echo
echo "Creating initial issues..."

gh issue create \
--repo "$OWNER/$REPO" \
--title "IFAS-001 - Formalizar a metodologia" \
--label IFAS

gh issue create \
--repo "$OWNER/$REPO" \
--title "AP-001 - Princípio da Tradutibilidade" \
--label ADR

gh issue create \
--repo "$OWNER/$REPO" \
--title "AP-003 - Princípio da Inovação Focada" \
--label ADR

gh issue create \
--repo "$OWNER/$REPO" \
--title "ADR-002 - Delegação da Compilação ao FPC" \
--label ADR

gh issue create \
--repo "$OWNER/$REPO" \
--title "ADR-003 - Modelo Conceitual" \
--label ADR

gh issue create \
--repo "$OWNER/$REPO" \
--title "RFC-001 - Convenções Gerais" \
--label RFC

gh issue create \
--repo "$OWNER/$REPO" \
--title "DJ-002 - Lições do Bun" \
--label DJ
