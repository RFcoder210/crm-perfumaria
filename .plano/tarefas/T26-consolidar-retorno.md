# T26 — Consolidar o retorno e listar os ajustes de campos

**Fase:** 7 — Semana de uso real
**Porte:** P
**Depende de:** T25
**Executor:** executor-tarefa

## Contexto mínimo
Após a semana de uso, é preciso transformar o retorno do perfumista em (1) atualização proposta do `CLAUDE.md` (itens de 6.3/7.3 movidos para CONFIRMADO ou reabertos) e (2) uma lista priorizada de ajustes de campos. As ideias fora da ordem de trabalho (lembrete de recompra, lucro, gráficos, estoque) continuam apenas registradas.

## Arquivos para ler
- `docs/roteiro-retorno.md` (com as respostas)
- `docs/respostas-entrevista.md` (se existir)
- `CLAUDE.md` (seções 4, 6, 7, 8)

## O que fazer
1. Crie `docs/retorno-semana.md` com: resumo (5 linhas) do que aconteceu; tabela de suposições (6.3 e 7.3) classificadas CONFIRMADA / REABERTA / SEM RESPOSTA, com a fala do amigo que justifica; incidentes.
2. Na mesma tabela ou em seção própria, "Ajustes de campos propostos": cada ajuste com descrição em uma frase, impacto no modelo de dados (sim/não, e qual campo), porte (P/M/G) e prioridade (alta = impede o uso; média = incomoda; baixa = desejo). Ajustes que alteram o formato de dados precisam de uma nota de migração dos dados já salvos.
3. Separe "fora da ordem de trabalho" (recompra, lucro, gráficos, estoque, cadastro de produtos) do que é ajuste de campo desta fase.
4. Escreva o "Texto proposto para o CLAUDE.md" (seções 6.2, 6.3, 7.2, 7.3): NÃO aplicar.

## Arquivos a criar ou alterar
- `docs/retorno-semana.md`

## Critério de pronto (verificável)
- [ ] O arquivo contém as seções: Resumo, Suposições, Ajustes de campos propostos, Fora da ordem, Texto proposto para o CLAUDE.md.
- [ ] Todas as 6 suposições de 7.3 aparecem classificadas.
- [ ] `git diff --stat CLAUDE.md` vazio.

## Cuidados
- Não decidir pelo desenvolvedor: a lista é uma proposta; o desenvolvedor aprova quais ajustes entram na T27.
- Se um ajuste for porte G, dividi-lo em ajustes menores na própria lista. Não commitar; proponha a mensagem.

## Resultado
(preenchido pelo executor)
