# IFAS-E-005 — Princípio da Orquestração sem Duplicação

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia  
**Aplicabilidade:** Orquestradores de bootstrap, pipelines de build, runners de tarefas e automação de processos no ecossistema IFAS.

---

## 1. Definição

Um componente orquestrador coordena exclusivamente a ordem de execução, o ciclo de vida e a validação de etapas de componentes independentes; ele nunca incorpora ou duplica a lógica interna pertencente aos módulos coordenados.

> O orquestrador sabe a ordem do que deve ser feito; os módulos especializados sabem como fazer.

## 2. Motivação

- A duplicação de lógica entre orquestradores e executores gera divergências sutis de comportamento quando um módulo é atualizado.
- Preservar módulos independentes permite executá-los e testá-los isoladamente durante o desenvolvimento ou depuração.
- Facilita a portabilidade e substituição granular de etapas sem reescrever o fluxo geral.

## 3. Diretrizes de Engenharia

1. **Delegação estrita:** O orquestrador (`bootstrap.sh`) invoca os scripts especializados como processos filhos com argumentos formais.
2. **Independência do diretório de chamada:** O orquestrador resolve os caminhos dos sub-scripts a partir do seu próprio local de instalação, não do CWD arbitrário.
3. **Monitoramento e propagação:** O orquestrador valida a existência/permissão de execução dos módulos antes de iniciar e interrompe imediatamente o pipeline na primeira falha detectada.
4. **Independência de teste:** Cada módulo coordenado deve continuar 100% funcional quando executado diretamente na linha de comando.

---

**Referências:**
- `tools/bootstrap/bootstrap.sh`
- `ifas/design-journal/DJ-0003-bootstrap-orquestracao-modulos-independentes.md`
- `ifas/principles/engineering/single-responsibility.md`
