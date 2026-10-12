# IFAS-P-001 — Princípio da Tradutibilidade

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Arquitetura  
**Aplicabilidade:** Todo projeto desenvolvido sob o IFAS

---

## 1. Princípio

Toda arquitetura deve ser projetada para ser:

- fácil de compreender por humanos;
- fácil de compreender por agentes de IA;
- fácil de transformar por humanos;
- fácil de transformar por agentes de IA;
- fácil de validar por humanos;
- fácil de validar por agentes de IA.

A arquitetura não deve depender de conhecimento implícito que não possa ser
reconstruído a partir do código, da documentação e dos artefatos de decisão.

> Se uma pessoa ou agente de IA precisa “adivinhar” uma decisão importante
> para modificar corretamente o sistema, a arquitetura ou sua documentação
> provavelmente precisam ser melhoradas.

## 2. Motivação

Sistemas modernos podem ser mantidos não apenas por equipes humanas, mas
também por agentes de IA capazes de analisar, modificar, testar e migrar
código.

Uma arquitetura que seja compreensível apenas para seu autor cria uma
dependência de conhecimento tácito e dificulta tanto a manutenção humana
quanto a transformação automatizada.

O IFAS considera, portanto, a capacidade de uma arquitetura ser interpretada
e transformada por diferentes agentes uma propriedade arquitetural.

## 3. Características

Uma arquitetura orientada à Tradutibilidade deve favorecer:

- módulos pequenos;
- responsabilidades claras;
- interfaces explícitas;
- ownership explícito;
- ciclos de vida documentados;
- invariantes documentados;
- baixo acoplamento;
- poucos efeitos colaterais;
- convenções consistentes;
- estruturas previsíveis;
- testes automatizados;
- ADRs completos;
- documentação próxima do artefato que descreve;
- rastreabilidade entre decisão, implementação e validação.

## 4. Conhecimento explícito

Sempre que uma decisão arquitetural depender de conhecimento que não seja
óbvio a partir da implementação, esse conhecimento deve ser registrado em
um artefato apropriado.

Possíveis artefatos incluem:

- ADR — decisão arquitetural;
- RFC — proposta ainda em discussão;
- Design Journal — aprendizado obtido durante a implementação;
- documentação próxima ao código — contrato, ciclo de vida ou invariante;
- testes automatizados — comportamento esperado e critério de validação.

## 5. Consequência

O Princípio da Tradutibilidade é uma regra arquitetural do IFAS, e não apenas
uma orientação. Decisões e implementações devem tornar explícito o contexto
necessário para sua compreensão, transformação e validação corretas.
