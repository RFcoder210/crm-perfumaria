# T28 — Fechamento: conferir os critérios e propor a atualização do CLAUDE.md

**Fase:** 7 — Semana de uso real
**Porte:** P
**Depende de:** T26, T27
**Executor:** executor-tarefa

## Contexto mínimo
Fecha o objetivo do `.plano/OBJETIVO.md`. Confere cada critério de conclusão com evidência, deixa o `CLAUDE.md` refletindo a realidade (seções 3, 6, 7 e 8) e registra a próxima fase (testes com Playwright em navegador de verdade), que não faz parte deste plano.

## Arquivos para ler
- `.plano/OBJETIVO.md` (critérios de conclusão)
- `.plano/ESTADO.md`
- `TESTES.md` (registro de execuções)
- `docs/retorno-semana.md`
- `CLAUDE.md`

## O que fazer
1. Crie no Resultado desta tarefa uma tabela "Critério | Evidência | Atendido (sim/não)" para os 6 critérios de conclusão do OBJETIVO. Evidências: saída de `npm test`, linhas do registro de execuções, endereço publicado com `curl`, resposta do amigo sobre o CSV, data da entrega, retorno registrado.
2. Escreva, em `docs/proposta-claude-md-final.md`, o texto exato para: seção 3 (estado atual: publicado, testado no celular, entregue), seção 6.2/6.3/7.2/7.3 (conforme T26), seção 8 (itens 1 a 4 concluídos; item 5 Playwright como próximo; item 6 em andamento) e seção 9 (sem mudança, salvo necessidade).
3. Liste no Resultado o que ficou pendente do objetivo e as ideias fora da ordem.

## Arquivos a criar ou alterar
- `docs/proposta-claude-md-final.md`

## Critério de pronto (verificável)
- [ ] A tabela cobre os 6 critérios, cada um com evidência ou "sem evidência".
- [ ] `docs/proposta-claude-md-final.md` existe e cobre as seções 3, 6, 7 e 8.
- [ ] `git diff --stat CLAUDE.md` vazio (aplicar só com confirmação do desenvolvedor, fora desta tarefa).

## Cuidados
- Não declarar critério atendido sem evidência. Não commitar; proponha a mensagem.

## Resultado
(preenchido pelo executor)
