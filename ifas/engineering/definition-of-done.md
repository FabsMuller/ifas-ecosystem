# Definition of Done (DoD) — IFAS Ecosystem

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia e Metodologia  
**Aplicabilidade:** Todo código, script, documento e sprint desenvolvida sob o ecossistema IFAS.

---

## 1. Princípio Fundamental

> Nada é considerado "Pronto" (Done) no IFAS apenas porque o código foi escrito. A conclusão exige **especificação prévia, conformidade com os princípios de engenharia, validação automatizada e registro explícito de conhecimento**.

---

## 2. Critérios de DoD por Tipo de Artefato

### 2.1 Decisões e Propostas Arquiteturais (ADRs e RFCs)
- [ ] Utiliza o template oficial (`adr-template.md` ou `rfc-template.md`).
- [ ] Contexto, justificativa, trade-offs e alternativas descartadas explicitados.
- [ ] Bounded contexts, invariantes e regras de engenharia claramente definidos.
- [ ] Status formalmente aprovado pelos Chief Architects.
- [ ] Links de rastreabilidade preenchidos (Princípios, Issues, DJs relacionados).

### 2.2 Scripts de Automação e Ferramentas (Bash / CLI)
- [ ] Validação estática de sintaxe executada (`bash -n caminho/script.sh`).
- [ ] Uso obrigatório de `set -euo pipefail` (*Fail-Fast*).
- [ ] Variáveis declaradas e inicializadas explicitamente (compatível com `set -u`).
- [ ] Padrão de incremento seguro adotado (`((++contador))` em vez de `((contador++))`).
- [ ] **Teste de Idempotência:** duas execuções consecutivas produzem o mesmo estado com `exit 0`.
- [ ] Resolução de caminhos determinística e independente do diretório de chamada (CWD).
- [ ] Nenhuma mutação irreversível ou `git push` implícito (*Automação Conservadora*).

### 2.3 Módulos e Pacotes Pascal (FreePascal / InstantFPC)
- [ ] Compilação limpa sem erros ou warnings (`{$mode objfpc}{$H+}`).
- [ ] Suíte de testes automatizados (FPCUnit) com 100% de aprovação.
- [ ] **Zero Memory Leaks:** Validação limpa com `HeapTrc` habilitado nos testes.
- [ ] Portabilidade verificada (Linux, macOS, Windows).
- [ ] Exemplos práticos funcionais adicionados em `implementations/instantfpc/examples/`.

### 2.4 Fechamento de Sprint e Releases
- [ ] Todos os entregáveis previstos no roadmap da sprint concluídos e testados.
- [ ] Lições aprendidas e anomalias técnicas registradas no Design Journal (`DJ-XXXX`).
- [ ] [`PROJECT_STATUS.md`](../../PROJECT_STATUS.md) atualizado com o sumário de entregas e próximo marco.
- [ ] [`docs/roadmap.md`](../../docs/roadmap.md) atualizado com os itens concluídos marcados.
- [ ] [`projectLog.md`](../../projectLog.md) sincronizado com o histórico de decisões e diálogos.
- [ ] Commits no Git estruturados e sem artefatos temporários residuais.

---

## 3. Matriz de Verificação Rápida

| Camada | Ferramenta de Verificação | Critério Mínimo |
|---|---|---|
| **Bash** | `bash -n` + 2x execução | Sintaxe válida + Idempotência |
| **Pascal** | `fpc -gl -gh` | Compilação + 0 Leaks |
| **Docs** | Revisão de templates | Rastreabilidade completa |
| **Sprint** | Status Docs | Sincronismo total |
