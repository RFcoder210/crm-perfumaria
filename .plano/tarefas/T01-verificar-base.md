# T01 — Verificar a base e alinhar o TESTES.md

**Fase:** 1 — Base local
**Porte:** P
**Depende de:** nenhuma
**Executor:** executor-tarefa

## Contexto mínimo
Projeto CRM de perfumaria: um único `index.html` (HTML, CSS e JavaScript puros) com leads e vendas, dados em `localStorage`. Antes de qualquer mudança é preciso registrar que a base está saudável (26 testes automáticos passando) e corrigir uma incoerência no `TESTES.md`: ele manda rodar `node teste.js`, mas o comando oficial é `npm test`.

## Arquivos para ler
- `CLAUDE.md` (seções 3, 8 e 9)
- `package.json`
- `TESTES.md` (seção "Testes automatizados", final do arquivo)

## O que fazer
1. Rode `git status --short` e anote o que aparece. Os itens `.claude - Copia/` e `CLAUDE - Copia.md` são cópias soltas do usuário: apenas registre, NÃO apague nem mova.
2. Rode `npm test` e anote a quantidade de linhas `ok` e de `FALHA`.
3. No `TESTES.md`, seção "Testes automatizados", troque `node teste.js` por `npm test` (mantendo `npm install` antes, para quem clonar o projeto).
4. Preencha a seção Resultado com o que foi observado.

## Arquivos a criar ou alterar
- `TESTES.md` (só o trecho do comando)

## Critério de pronto (verificável)
- [ ] `npm test` termina com "Todos os testes passaram." e código de saída 0.
- [ ] `grep -n "node teste.js" TESTES.md` não retorna nada; `grep -n "npm test" TESTES.md` retorna a linha nova.
- [ ] Seção Resultado lista a saída resumida de `git status --short`.

## Cuidados
- Não editar `index.html`.
- Não commitar: proponha a mensagem em português no Resultado (sugestão: "Corrige o comando de teste no TESTES.md"). O orquestrador pede a confirmação do desenvolvedor.
- Se algum teste falhar, pare e devolva PENDENTE com a saída completa da falha.

## Resultado
**Status:** CONCLUIDA

**git status --short (antes da edição):** ` M .plano/OBJETIVO.md`; não rastreados: `.plano/CRONOGRAMA.md`, `ESTADO.md`, `PLANO.md`, `.plano/tarefas/T01..T28` e `docs/`. Os itens `.claude - Copia/` e `CLAUDE - Copia.md` não apareceram no git status nem na listagem da raiz (nada a preservar ou mover; nada foi tocado).

**npm test:** 26 linhas `ok`, 0 `FALHA`, "Todos os testes passaram.", código de saída 0.

**TESTES.md:** na seção "Testes automatizados", `node teste.js` foi trocado por `npm test` (linha 65), mantendo `npm install` antes. `grep -n "node teste.js" TESTES.md` não retorna nada; `grep -n "npm test"` retorna a linha 65.

**Arquivo alterado:** `TESTES.md`. `index.html` não foi editado. Nada commitado.

**Mensagem de commit proposta:** "Corrige o comando de teste no TESTES.md"
