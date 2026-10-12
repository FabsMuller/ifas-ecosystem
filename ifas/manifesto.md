# Manifesto IFAS

**Status:** Draft 1.0  
**Categoria:** Identidade e Metodologia  
**Aplicabilidade:** Todo projeto e artefato desenvolvido sob o IFAS.

---

## Por que existimos

O IFAS existe para construir sistemas que possam ser compreendidos,
transformados e validados com segurança ao longo do tempo — por pessoas e por
agentes de IA.

Não buscamos apenas produzir código que funcione hoje. Buscamos produzir
conhecimento técnico que continue utilizável quando autores, ferramentas e
contextos mudarem.

## Nossos compromissos

### 1. Tornamos a intenção explícita

Decisões relevantes não devem sobreviver apenas na memória de quem as tomou.
Registramos contexto, alternativas, invariantes e consequências no artefato
apropriado.

### 2. Projetamos para tradutibilidade

Uma boa arquitetura permite que outra pessoa ou agente responda o que um
componente faz, por que existe, quais regras preserva e como pode ser mudado
sem precisar adivinhar.

### 3. Preferimos evidência a suposição

Uma alteração não está pronta porque parece correta. Ela deve possuir
validação proporcional ao risco: testes, execução verificável, revisão ou
outra evidência objetiva.

### 4. Mantemos as decisões rastreáveis

Necessidade, decisão, princípio, implementação, validação e aprendizado
devem formar uma trilha navegável. O histórico explica o que aconteceu; os
artefatos normativos explicam por que e como manter a decisão.

### 5. Automatizamos com responsabilidade

Automação reduz trabalho mecânico e aumenta a previsibilidade, mas não assume
autoridade humana. Ela deve ser idempotente, conservadora, clara diante de
falhas e limitada ao escopo autorizado.

### 6. Favorecemos fronteiras simples e responsabilidades claras

Composição de componentes focados é preferível a centralização de lógica.
Interfaces, ownership, ciclos de vida e invariantes devem ser visíveis onde
forem necessários.

### 7. Tratamos IA como colaboradora responsável

Agentes de IA podem analisar, implementar e validar; por isso recebem contexto
explícito, limites de autoridade e critérios objetivos de encerramento. IA não
substitui decisão humana onde a autorização ou o impacto exigem responsabilidade
humana.

### 8. Preservamos o aprendizado

Anomalias, trade-offs e descobertas reutilizáveis são registrados para que a
próxima mudança comece mais informada do que a anterior.

### 9. Evoluímos pela prática

Princípios e processos são hipóteses operacionais. Devem ser validados em
projetos reais, revisados quando necessário e nunca mantidos apenas por hábito.

## Medida de sucesso

O IFAS é bem aplicado quando um novo colaborador — humano ou IA — consegue
chegar ao repositório, compreender o estado atual, propor uma mudança limitada,
validá-la e explicar sua relação com as decisões do sistema.

---

**Referências:**

- `ifas/principles/architecture/translatability.md` (IFAS-P-001)
- `ifas/principles/engineering/`
- `ifas/engineering/traceability-framework.md`
- `ifas/engineering/ai-ready-context.md`
- `ifas/engineering/definition-of-done.md`
