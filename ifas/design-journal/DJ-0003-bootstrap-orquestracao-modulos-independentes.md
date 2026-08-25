# DJ-0003 — Bootstrap: orquestração de módulos independentes

**Status:** Accepted
**Data:** 2026-08-25
**Contexto:** Sprint 1 — Bootstrap Infrastructure

---

## Contexto

O bootstrap do IFAS Ecosystem precisa preparar filesystem, Git e GitHub em
uma ordem conhecida, sem acoplar as responsabilidades de cada etapa.

## Decisão

Manter cada bootstrap como script executável e independente, e usar
`tools/bootstrap/bootstrap.sh` apenas como orquestrador. O orquestrador deve:

- resolver caminhos a partir da localização do próprio script;
- validar a presença e a permissão de execução dos módulos;
- executar os módulos na ordem filesystem, Git e GitHub;
- interromper a execução e informar claramente a primeira falha.

## Justificativa

Essa separação preserva a possibilidade de executar e validar cada módulo
isoladamente, enquanto fornece um ponto de entrada único para preparar o
ambiente. A resolução de caminhos pelo próprio script também torna a execução
independente do diretório de trabalho atual.

## Regra de Engenharia

> Um orquestrador de bootstrap coordena etapas; não incorpora as
> responsabilidades dos módulos que coordena.

## Resultado

`./tools/bootstrap/bootstrap.sh` passou a ser o ponto de entrada único da
Sprint 1, com execução determinística e falha clara por etapa.

## Referências

```text
tools/bootstrap/bootstrap.sh
tools/bootstrap/filesystem.sh
tools/bootstrap/git.sh
tools/bootstrap/github.sh
```
