# IFAS-E-001 — Princípio da Idempotência

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia  
**Aplicabilidade:** Todos os scripts de automação, pipelines, ferramentas de bootstrap e migrações do ecossistema IFAS.

---

## 1. Definição

Toda operação de automação, configuração de ambiente ou mutação de estado deve ser estritamente idempotente:

> Executar a mesma operação uma ou múltiplas vezes sobre o mesmo ambiente deve produzir exatamente o mesmo estado final, sem criar recursos duplicados, corromper dados existentes ou gerar efeitos colaterais imprevistos.

## 2. Motivação

Em ecossistemas que combinam humanos e agentes autônomos de IA:
- Falhas parciais ocorrem e exigem reinicializações imediatas.
- Re-execuções preventivas são comuns para garantir conformidade de estado.
- Scripts não idempotentes criam artefatos órfãos, registros duplicados em ferramentas remotas (como GitHub/APIs) e estados inconsistentes difíceis de depurar.

## 3. Diretrizes Práticas de Engenharia

Para cumprir a idempotência, todo componente de automação do IFAS deve:

1. **Inspecionar antes de agir:** Verificar a existência prévia do recurso (diretório, arquivo, branch, label, milestone, pacote) antes de tentar criá-lo.
2. **Tratar existência como sucesso neutro:** Se o recurso já existe no estado desejado, informar o fato de forma clara e prosseguir sem erro.
3. **Não realizar mutações cegas:** Evitar comandos que acumulem dados sem verificação (ex.: `>>` descontrolado, criação de nomes aleatórios a cada execução).
4. **Isolar etapas não idempotentes:** Operações com efeitos externos irreversíveis (como commits, tags ou publicações remotas) nunca devem rodar no mesmo ciclo de preparação/bootstrap básico sem gatilho explícito.

## 4. Critério de Validação (DoD da Idempotência)

Nenhum script de automação ou ferramenta de bootstrap é considerado concluído no IFAS sem passar pelo teste de duas execuções consecutivas:
- **1ª Execução:** Cria/configura o estado inicial esperado com sucesso (`exit 0`).
- **2ª Execução:** Detecta todos os recursos existentes, não gera duplicações e finaliza com sucesso (`exit 0`).

---

**Referências:**
- `tools/bootstrap/filesystem.sh`
- `tools/bootstrap/git.sh`
- `tools/bootstrap/github.sh`
- `ifas/design-journal/DJ-0001`
