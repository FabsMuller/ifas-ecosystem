# Framework de Rastreabilidade — IFAS Ecosystem

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia e Metodologia  
**Aplicabilidade:** Todo artefato arquitetural, implementação, validação e
aprendizado produzido sob o IFAS.

---

## 1. Objetivo

Garantir que uma decisão importante possa ser percorrida de ponta a ponta:
da necessidade que a motivou até a implementação, a validação e o conhecimento
registrado após sua aplicação.

> Todo comportamento relevante deve responder, sem adivinhação: **por que
> existe, qual decisão o orienta, onde foi implementado e como foi validado.**

## 2. Cadeia mínima de rastreabilidade

Quando aplicável, os artefatos devem formar a seguinte cadeia:

```text
Necessidade / Issue
        ↓
RFC ou ADR
        ↓
Princípios IFAS aplicáveis
        ↓
Implementação
        ↓
Validação (testes, revisão ou execução verificável)
        ↓
Design Journal / Project Log
```

A cadeia não exige que todos os tipos de artefato existam em toda alteração.
Alterações pequenas podem começar na implementação e nos testes; decisões com
impacto arquitetural devem ter ADR ou RFC correspondente. A ausência de um elo
precisa ser explícita e justificada no artefato mais próximo.

## 3. Identificadores e referências

Os identificadores oficiais devem ser estáveis e aparecer em links Markdown,
commits, issues, testes ou documentação relacionada.

| Tipo de artefato | Padrão | Exemplo |
| --- | --- | --- |
| Princípio arquitetural | `IFAS-P-###` | `IFAS-P-001` |
| Princípio de engenharia | `IFAS-E-###` | `IFAS-E-001` |
| Architecture Decision Record | `ADR-###` | `ADR-001` |
| Request for Comments | `RFC-###` | `RFC-001` |
| Design Journal | `DJ-####` | `DJ-0003` |
| Issue externa | identificador da plataforma | `#42` |

Não se deve renumerar um identificador já publicado. Um artefato substituído
deve apontar para seu sucessor e preservar a referência histórica.

## 4. Regras de ligação

### 4.1 Princípios

Todo ADR, RFC, script ou módulo relevante deve citar os princípios IFAS que
orientaram suas restrições ou critérios de aceite. A referência pode ser um
link para o arquivo do princípio ou seu identificador explícito.

### 4.2 Decisões e propostas

- Um **RFC** registra uma proposta aberta e deve listar as decisões ou
  princípios que a influenciam.
- Um **ADR** registra a decisão adotada, suas alternativas e os artefatos que
  ela afeta.
- Quando um RFC resultar em ADR, ambos devem conter links recíprocos.

### 4.3 Implementação e validação

- O artefato de decisão deve apontar para os caminhos de implementação e para
  a evidência de validação.
- Testes devem expressar o comportamento ou invariante que verificam; quando
  o vínculo não for evidente pelo nome do teste, ele deve ser documentado.
- Commits podem citar IDs para facilitar a navegação, mas não substituem os
  links duráveis da documentação.

### 4.4 Aprendizado operacional

Quando a implementação revelar uma limitação, anomalia, ajuste de processo ou
conhecimento reutilizável, um Design Journal deve referenciar a decisão,
princípio, implementação ou teste pertinente. O `projectLog.md` registra a
cronologia; ele não substitui ADRs, RFCs ou DJs.

## 5. Matriz de rastreabilidade

Para mudanças de escopo relevante, use uma matriz simples no ADR, RFC ou
documento de planejamento:

| Necessidade | Decisão/Proposta | Princípios | Implementação | Validação | Aprendizado |
| --- | --- | --- | --- | --- | --- |
| Issue ou contexto | ADR/RFC | IDs IFAS | caminhos | teste, revisão ou execução | DJ/Project Log |

Uma célula pode conter `N/A`, desde que o motivo seja registrado. A matriz é
uma visão de navegação: não duplica o conteúdo dos artefatos vinculados.

## 6. Critérios de verificação

Uma alteração está rastreável quando:

- sua motivação e responsabilidade podem ser identificadas;
- as decisões e princípios aplicáveis estão explícitos;
- os caminhos modificados podem ser localizados;
- há evidência proporcional de validação;
- aprendizados relevantes foram registrados no artefato adequado;
- os links não dependem de conhecimento tácito ou de uma conversa isolada.

## 7. Relação com a Tradutibilidade

Este framework operacionaliza o **IFAS-P-001 — Princípio da
Tradutibilidade**. A rastreabilidade transforma contexto arquitetural em uma
trilha navegável para pessoas e agentes de IA, reduzindo a necessidade de
inferir intenções a partir de código ou histórico disperso.

## 8. Próxima revisão

Validar o framework em uma alteração real do InstantFPC e registrar os ajustes
necessários em um Design Journal.

---

**Referências:**

- `ifas/principles/architecture/translatability.md` (IFAS-P-001)
- `ifas/engineering/definition-of-done.md`
- `ifas/knowledge-base/templates/adr-template.md`
- `ifas/knowledge-base/templates/rfc-template.md`
- `ifas/knowledge-base/templates/dj-template.md`
