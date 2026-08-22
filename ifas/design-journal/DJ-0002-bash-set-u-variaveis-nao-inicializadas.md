# DJ-0002 — Bash: `set -u` e variáveis locais não inicializadas

**Status:** Accepted
**Data:** 2026-08-22
**Contexto:** Sprint 1.2 — `git.sh`

---

## Contexto

Durante a implementação do `tools/bootstrap/git.sh`, o script
foi executado com:

```bash
set -euo pipefail
```

A função `check_identity()` declarava variáveis locais sem
inicializá-las explicitamente:

```bash
local user_name
local user_email
```

Posteriormente, essas variáveis eram utilizadas em uma expressão
condicional:

```bash
[[ -n "$user_name" && -n "$user_email" ]]
```

Durante a execução, o Bash encerrou o script com:

```text
user_email: variável desassociada
```

---

## Causa

A opção:

```bash
set -u
```

(`nounset`) faz com que o Bash trate referências a variáveis
não definidas como erro.

A simples declaração:

```bash
local user_email
```

não deve ser considerada suficiente quando a variável será
referenciada em um script que utiliza `set -u`.

---

## Decisão

Toda variável local que possa ser utilizada sob `set -u` deve ser
explicitamente inicializada.

Preferir:

```bash
local user_name=""
local user_email=""
```

em vez de:

```bash
local user_name
local user_email
```

---

## Justificativa

A inicialização explícita:

- evita encerramentos inesperados;
- torna o estado inicial da variável evidente;
- melhora a legibilidade;
- reduz dependência de comportamentos implícitos;
- torna o código mais previsível para humanos e ferramentas de IA.

---

## Regra de Engenharia

> **Com `set -u` habilitado, variáveis locais devem ser explicitamente
> inicializadas antes de serem utilizadas.**

Exemplo recomendado:

```bash
local value=""
```

---

## Relação com outros princípios

Este aprendizado reforça o princípio de:

**Fail Fast, Fail Clearly**

O script deve falhar quando encontrar uma condição realmente
inválida, mas não deve interpretar uma variável local não inicializada
como consequência acidental da implementação.

Também reforça o:

**Princípio da Tradutibilidade**

Código explícito sobre seu estado inicial é mais fácil de compreender,
transformar e validar por humanos e agentes de IA.

---

## Resultado

O problema foi corrigido alterando:

```bash
local user_name
local user_email
```

para:

```bash
local user_name=""
local user_email=""
```

Após a correção, o `git.sh` executou corretamente tanto em:

1. um repositório Git já existente;
2. um diretório sem repositório Git, inicializando-o na branch `main`.

---

## Referência

Artefato relacionado:

```text
tools/bootstrap/git.sh
```

Sprint:

```text
Sprint 1.2 — Git Bootstrap
```
