# T02 — Remover páginas não usadas do teste.js

**Fase:** 1 — Base local
**Porte:** P
**Depende de:** T01
**Executor:** executor-tarefa

## Contexto mínimo
O `teste.js` (teste automatizado com jsdom, roda com `npm test`) cria três páginas simuladas que nunca são usadas: `dom2`, `dom3` e `dom4`. Não afetam o resultado, mas confundem quem lê. É uma pendência registrada no `CLAUDE.md` (seção 3). Analogia: são três cadeiras postas na mesa para convidados que nunca chegaram.

## Arquivos para ler
- `teste.js` (linhas 42 a 57, trecho "Sessão 2")

## O que fazer
1. Confirme com Grep que `dom2`, `dom3` e `dom4` (e suas variáveis `doc2` etc., se houver) não são usadas em outro ponto do arquivo além da criação.
2. Remova as declarações de `dom2`, `dom3`, `dom4` e as linhas de `setItem` associadas. Mantenha `dom5` e o comentário da sessão, ajustando o comentário se ficar incoerente.
3. NÃO renomeie `dom5`/`doc5`/`dom6` (evita mudança desnecessária).
4. Rode `npm test`.

## Arquivos a criar ou alterar
- `teste.js`

## Critério de pronto (verificável)
- [ ] `grep -nE "dom[234]\b" teste.js` não retorna nada.
- [ ] `npm test` termina com "Todos os testes passaram." e o mesmo número de linhas `ok` de antes (26).

## Cuidados
- Não alterar nenhuma verificação (`ok(...)`), apenas remover o código morto.
- Não commitar: proponha a mensagem (sugestão: "Remove páginas de teste não usadas do teste.js").

## Resultado
STATUS: CONCLUIDA. Removidas as criações de `dom2`, `dom3`, `dom4` (e seus `setItem`) do `teste.js`; mantidos `dom5` e o comentário da sessão. Nenhuma verificação `ok(...)` alterada.
Evidência: `grep -nE "dom[234]\b" teste.js` sem saída; `npm test` terminou com "Todos os testes passaram." e 26 linhas `ok`.
Mensagem de commit proposta: "Remove páginas de teste não usadas do teste.js" (não commitado).
