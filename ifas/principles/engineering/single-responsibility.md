# IFAS-E-004 — Princípio da Responsabilidade Única

**Status:** Approved  
**Versão:** 1.0  
**Categoria:** Engenharia  
**Aplicabilidade:** Estrutura de scripts, bibliotecas, módulos de domínio e ferramentas no ecossistema IFAS.

---

## 1. Definição

Cada script, módulo ou ferramenta deve possuir uma única responsabilidade de domínio claramente delimitada e apenas uma razão fundamental para mudar.

> Um componente deve fazer apenas uma coisa, mas fazê-la de forma completa, previsível e verificável.

## 2. Motivação

- Scripts multifuncionais e acoplados tornam-se frágeis, difíceis de reutilizar e complexos de testar de forma unitária.
- A separação de responsabilidades permite evolução independente (ex.: mudar a criação de diretórios sem afetar a lógica do Git).
- Agentes de IA e humanos conseguem raciocinar com muito mais precisão sobre componentes focados e com interfaces mínimas.

## 3. Diretrizes de Engenharia

1. **Fronteiras claras de atuação:**
   - `filesystem.sh`: gerencia unicamente estrutura local de diretórios e arquivos iniciais.
   - `git.sh`: gerencia unicamente a inicialização, configuração e branches do Git local.
   - `github.sh`: gerencia unicamente metadados e recursos na API/CLI do GitHub remoto.
   - `config.sh`: centraliza unicamente variáveis e constantes compartilhadas.
2. **Sem vazamento de abstração:** Um script de infraestrutura local não deve executar chamadas de rede ou APIs remotas.
3. **Composição sobre centralização:** Sistemas complexos devem ser construídos pela composição de ferramentas especializadas, não por monolitos de automação.

---

**Referências:**
- `tools/bootstrap/filesystem.sh`
- `tools/bootstrap/git.sh`
- `tools/bootstrap/github.sh`
- `ifas/principles/architecture/translatability.md`
