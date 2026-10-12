# IFAS-E-002 — Princípio da Automação Conservadora

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia  
**Aplicabilidade:** Todo script de automação, ferramenta de provisionamento e agente de execução no ecossistema IFAS.

---

## 1. Definição

A automação deve preparar, inspecionar e validar o ambiente de forma confiável, mas nunca deve executar ações destrutivas, mutações irreversíveis ou publicações em ambientes remotos de maneira autônoma ou implícita.

> A automação serve para reduzir esforço mecânico, não para assumir autoridade sobre decisões que competem ao operador humano.

## 2. Motivação

Em ecossistemas complexos com intervenção de agentes autônomos de IA:
- Comandos destrutivos não intencionais (como `git push --force`, remoção recursiva de diretórios ou exclusão de branches) podem causar perda de histórico e dados.
- Operações de publicação externa involuntárias poluem repositórios compartilhados e ambientes remotos.
- A segurança e a previsibilidade operacional aumentam quando ferramentas locais respeitam limites estritos de autoridade.

## 3. Diretrizes de Engenharia

1. **Sem `git push` implícito:** Scripts de bootstrap ou automação local nunca devem realizar push para repositórios remotos automaticamente.
2. **Preservação sobre sobrescrita:** Quando um recurso já existe com conteúdo conflitante, a ferramenta deve alertar e preservar o estado existente, nunca sobrescrever silenciosamente.
3. **Não-destrutividade:** Operações de remoção em lote, limpeza agressiva ou reset de estado exigem flags explícitas ou confirmação interativa.
4. **Isolamento de privilégios:** A automação deve operar estritamente no diretório de trabalho do projeto e com as menores permissões necessárias.

---

**Referências:**
- `tools/bootstrap/git.sh`
- `tools/bootstrap/github.sh`
- `ifas/principles/architecture/translatability.md`
