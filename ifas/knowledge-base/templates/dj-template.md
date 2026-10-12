# DJ-XXXX — [Título Curto e Preciso da Lição Aprendida / Decisão Técnica]

**Status:** [Accepted | Superseded by DJ-YYYY]  
**Data:** AAAA-MM-DD  
**Contexto:** [Sprint X.Y — Nome da Ferramenta / Módulo Envolvido]  
**Autor(es):** [Nome / Papel / Agente de IA]  

---

## 1. Contexto e Sintoma

Descreva o que estava sendo implementado ou executado quando o comportamento inesperado ou a necessidade de padronização ocorreu.

```text
Exemplo do erro no terminal / log / exceção:
user_email: variável desassociada
```

## 2. Causa Raiz

Explicação técnica aprofundada do porquê o comportamento ocorreu (ex.: particularidade do compilador FreePascal, comportamento do interpretador Bash, flags de ambiente como `set -e` / `set -u`, concorrência ou I/O).

## 3. Decisão e Solução Adotada

Demonstração do padrão anterior (problemático) versus o novo padrão adotado no IFAS:

### Padrão Incorreto / Problemático:
```bash
# Código que causava o problema
((contador++))
```

### Padrão Adotado (IFAS Standard):
```bash
# Código corrigido e padronizado
((++contador))
```

## 4. Justificativa

Por que esta solução é a mais robusta?
- Compatibilidade e previsibilidade.
- Prevenção de efeitos colaterais e encerramentos anômalos.
- Uniformidade em todo o ecossistema.

## 5. Regra de Engenharia Derivada

> **Regra Obrigatória:** Formulação concisa e imperativa da regra que passa a valer para todos os projetos e scripts do ecossistema IFAS.

## 6. Resultado da Validação

Evidência de que a correção foi testada e validada com sucesso em ambiente limpo:
- Testes automatizados executados.
- Comportamento de idempotência e ausência de regressões verificado.

## 7. Referências e Arquivos Afetados

```text
tools/caminho/do/script.sh
ifas/principles/engineering/fail-fast.md
```
