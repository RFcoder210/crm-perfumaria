# T07 — Corrigir as falhas encontradas no celular (condicional)

**Fase:** 2 — Teste no celular
**Porte:** M
**Depende de:** T06
**Executor:** executor-tarefa

## Contexto mínimo
Tarefa condicional. Se a T06 registrou falhas do teste no celular, esta tarefa as corrige no `index.html`. Se a T06 registrou "nenhuma falha", marque esta tarefa como CONCLUIDA com a nota "sem falhas a corrigir" e não altere nada.

## Arquivos para ler
- `.plano/tarefas/T06-registrar-resultado-celular.md` (seção Resultado, lista de falhas)
- `.plano/PENDENCIAS.md`
- `.claude/commands/funcionalidade.md` (roteiro de desenvolvimento; toda mudança no `index.html` o segue)
- `CLAUDE.md` (seções 4, 5, 6 e 9)
- `index.html` (apenas os trechos ligados a cada falha; use Grep)

## O que fazer
1. Para cada falha, uma de cada vez: localizar a causa no `index.html`, aplicar a menor correção possível, acrescentar ou ajustar o item do `TESTES.md` e, se for testável em jsdom, um teste no `teste.js`.
2. Rodar `npm test` após cada correção.
3. Se uma correção alterar o formato de dados em `localStorage` (chave `crm-perfumes:dados`), parar e devolver PENDENTE: isso exige decisão do desenvolvedor.
4. Se houver mais de 3 falhas independentes ou uma falha que exija reescrever a tela, parar e devolver PENDENTE pedindo replanejamento.
5. Listar no Resultado, por falha, o que mudou e quais itens o desenvolvedor deve reconferir no celular.

## Arquivos a criar ou alterar
- `index.html`, `teste.js`, `TESTES.md`

## Critério de pronto (verificável)
- [ ] `npm test` passa.
- [ ] Cada falha da lista tem uma linha no Resultado com "corrigida" e o trecho alterado.
- [ ] O Resultado lista os itens do `TESTES.md` a reconferir no celular (e a reconferência é anotada como AGUARDA USUÁRIO no ESTADO.md pelo orquestrador).

## Cuidados
- Sem framework, sem etapa de build, sem otimização de desempenho.
- Uma alteração por vez, um commit proposto por correção, em português. Não commitar sem confirmação.
- Não implementar ideias fora da ordem (recompra, lucro, gráficos, estoque).

## Resultado
(preenchido pelo executor)
