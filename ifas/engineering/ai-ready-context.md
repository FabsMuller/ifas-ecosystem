# AI-Ready Context — IFAS Ecosystem

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia e Metodologia  
**Aplicabilidade:** Toda tarefa executada por, ou entregue para, um agente de
IA no ecossistema IFAS.

---

## 1. Objetivo

Permitir que um agente de IA compreenda e altere o sistema com segurança sem
depender de memória externa, de suposições sobre a intenção do autor ou de uma
conversa isolada.

O contexto fornecido a um agente deve ser suficiente para responder:

1. Qual resultado é esperado?
2. Qual é o escopo e o que está explicitamente fora dele?
3. Quais decisões, princípios e invariantes devem ser preservados?
4. Quais arquivos e componentes são relevantes?
5. Como a alteração será validada?
6. Qual autoridade o agente possui para modificar, publicar ou descartar
   informações?

## 2. Fonte de verdade

O repositório é a fonte de verdade do contexto de projeto. Conversas, memória
de agentes e instruções transitórias podem orientar uma tarefa, mas não devem
ser o único local de uma decisão necessária para manter ou validar o sistema.

O pacote mínimo de contexto deve apontar, quando existirem, para:

- `PROJECT_STATUS.md` — estado e próximo marco;
- `docs/roadmap.md` — planejamento e entregáveis;
- `ifas/principles/` — princípios arquiteturais e de engenharia;
- `ifas/architecture/adr/` e `ifas/architecture/rfc/` — decisões e propostas;
- `ifas/engineering/definition-of-done.md` — critérios de conclusão;
- Design Journals relevantes — aprendizados e restrições descobertas;
- instruções locais do repositório, como `AGENTS.md`.

## 3. Cápsula de contexto de tarefa

Toda tarefa de impacto não trivial destinada a um agente de IA deve conter ou
referenciar uma cápsula com os campos abaixo. A cápsula pode residir em uma
issue, RFC, ADR, plano de execução ou instrução de tarefa, desde que seja
versionada ou vinculada a artefatos duráveis.

```markdown
## Contexto da tarefa

**Objetivo:** resultado observável esperado.
**Escopo:** componentes e comportamento que podem ser alterados.
**Fora de escopo:** mudanças que não devem ser realizadas.
**Restrições e invariantes:** regras que precisam permanecer verdadeiras.
**Referências IFAS:** princípios, ADRs, RFCs, DJs e issues relevantes.
**Artefatos de trabalho:** caminhos que devem ser lidos, criados ou alterados.
**Validação:** testes, comandos, revisão ou evidência exigida.
**Autoridade:** ações autorizadas e ações que exigem confirmação humana.
**Critério de encerramento:** condição objetiva para considerar a tarefa pronta.
```

Campos sem aplicação devem ser preenchidos com `N/A` e uma justificativa
breve. O objetivo é evitar lacunas silenciosas, não gerar documentação
burocrática.

## 4. Ordem de leitura recomendada

Antes de alterar o sistema, o agente deve seguir esta ordem, ajustada ao
escopo da tarefa:

1. Ler as instruções locais e confirmar as restrições de escrita.
2. Ler `PROJECT_STATUS.md` e o item relevante do roadmap.
3. Localizar os princípios, ADRs, RFCs e DJs vinculados à tarefa.
4. Inspecionar a implementação e os testes afetados antes de propor mudança.
5. Confirmar a cápsula de contexto, especialmente escopo, invariantes,
   autoridade e validação.
6. Registrar links de rastreabilidade ao entregar a alteração.

Essa sequência reduz a chance de o agente confundir estado histórico com o
estado atual do repositório.

## 5. Regras de segurança e autoridade

Um agente de IA deve tratar como proibidas, até receber autorização explícita:

- publicar, fazer push ou alterar recursos remotos;
- excluir, sobrescrever ou descartar trabalho existente;
- ampliar o escopo da tarefa para componentes não relacionados;
- presumir que arquivos não versionados podem ser removidos;
- transformar uma hipótese em decisão arquitetural sem ADR, RFC ou aprovação
  correspondente.

Quando o contexto for insuficiente para uma alteração de impacto material, o
agente deve registrar a lacuna e solicitar direção, em vez de inventar uma
regra de negócio, uma decisão arquitetural ou uma permissão operacional.

## 6. Contexto verificável e atualizável

Contexto útil precisa ser verificável no repositório e atualizado no mesmo
fluxo da mudança que ele descreve. Ao concluir uma tarefa, devem ser revisados
os artefatos que alteraram sua compreensão:

- decisão ou proposta, se houve mudança arquitetural;
- links de rastreabilidade;
- testes e evidências de validação;
- `PROJECT_STATUS.md` e roadmap, quando houver mudança de marco;
- Design Journal, quando houver aprendizado reutilizável;
- `projectLog.md`, quando houver registro cronológico relevante.

## 7. Relação com os princípios IFAS

O AI-Ready Context concretiza o **IFAS-P-001 — Princípio da
Tradutibilidade**, fornecendo contexto explícito para que humanos e agentes
de IA cheguem à mesma interpretação operacional. Também aplica:

- **IFAS-E-002 — Automação Conservadora**, ao delimitar autoridade;
- **IFAS-E-003 — Falhar Rápido e Claramente**, ao exigir que lacunas de
  contexto sejam expostas antes de causar uma alteração incorreta;
- o **Framework de Rastreabilidade**, ao vincular intenção, artefatos,
  validação e aprendizado.

## 8. Critério de validação

Este padrão será considerado útil quando um agente sem contexto prévio consiga,
a partir da cápsula e dos artefatos vinculados:

- explicar o objetivo e os limites da mudança;
- identificar os arquivos e invariantes relevantes;
- executar a validação prevista;
- justificar as alterações com referências rastreáveis;
- reconhecer e escalar permissões ou informações ausentes.

## 9. Próxima revisão

Aplicar o padrão a uma alteração real do InstantFPC e registrar em Design
Journal o que faltou para permitir uma execução correta de ponta a ponta.

---

**Referências:**

- `ifas/principles/architecture/translatability.md` (IFAS-P-001)
- `ifas/principles/engineering/conservative-automation.md` (IFAS-E-002)
- `ifas/principles/engineering/fail-fast.md` (IFAS-E-003)
- `ifas/engineering/traceability-framework.md`
- `ifas/engineering/definition-of-done.md`
