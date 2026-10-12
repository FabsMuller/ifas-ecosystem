# IFAS-E-003 — Princípio do Falhar Rápido e Claramente

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia  
**Aplicabilidade:** Todos os scripts de automação, ferramentas de linha de comando e módulos de software no ecossistema IFAS.

---

## 1. Definição

Quando uma pré-condição necessária não for atendida ou ocorrer uma falha durante a execução, o sistema deve interromper imediatamente a operação e emitir um diagnóstico claro, estruturado e acionável.

> Falhar imediatamente com uma causa evidente é infinitamente superior a continuar a execução em estado corrompido ou emitir erros tardios e obscuros.

## 2. Motivação

- Execuções parciais após erros intermediários geram estados híbridos inconsistentes difíceis de reverter.
- Diagnósticos genéricos desperdiçam tempo de depuração de humanos e induzem agentes de IA a correções equivocadas.
- A verificação precoce de pré-requisitos garante integridade operacional antes de qualquer mutação.

## 3. Diretrizes de Engenharia

1. **Configuração estrita do shell:** Todo script Bash deve iniciar obrigatoriamente com `set -euo pipefail`.
2. **Checagem prévia de dependências:** Binários necessários (ex.: `git`, `gh`, `fpc`, `tree`) e variáveis de ambiente devem ser validados antes do início das tarefas.
3. **Diagnóstico acionável:** Mensagens de erro devem seguir o padrão:
   - **O que falhou:** identificação precisa do comando ou pré-requisito.
   - **Por que falhou:** motivo ou contexto da falha.
   - **Como corrigir:** ação recomendada para o operador/agente resolver.
4. **Códigos de retorno explícitos:** O processo deve retornar código de saída não-zero (`exit 1` ou código específico) imediatamente ao falhar.

---

**Referências:**
- `ifas/design-journal/DJ-0001`
- `ifas/design-journal/DJ-0002`
- `tools/bootstrap/check-prerequisites.sh`
