# T23 — Preparar o roteiro de retorno após uma semana de uso

**Fase:** 6 — Entrega
**Porte:** P
**Depende de:** T13 (ou T11 se a entrevista não ocorreu)
**Executor:** executor-tarefa

## Contexto mínimo
O critério final do projeto é acompanhar uma semana de uso real e registrar o retorno no `CLAUDE.md`, movendo os itens da seção 7.3 para CONFIRMADO ou reabrindo-os. Para isso é preciso um roteiro curto de perguntas, para o desenvolvedor conversar com o perfumista no meio e no fim da semana, e um jeito de saber o que ele fez no sistema sem invadir os dados dele.

## Arquivos para ler
- `CLAUDE.md` (seções 6.3, 7.3, 8)
- `docs/respostas-entrevista.md` (se existir)
- `docs/roteiro-entrevista.md`

## O que fazer
1. Crie `docs/roteiro-retorno.md` com: (a) contatos combinados: mensagem no 3º dia de uso e conversa no 7º dia (dias contados a partir da entrega); (b) perguntas do 3º dia (conseguiu abrir? travou? o que estranhou?); (c) perguntas do 7º dia, em palavras simples: quantas pessoas cadastrou, quantas vendas lançou, o que faltou, o que sobrou, o que confundiu, se exportou a planilha e se conseguiu abri-la, se usou pelo celular entre atendimentos, se precisou de algum campo que não existe (preço de custo, tamanho do frasco, forma de pagamento, prazo de recompra, cadastro de produtos), se vende parcelado, se produz sob encomenda ou em lote; (d) uma tabela "Suposição de 7.3 | Pergunta que a testa | Resposta | CONFIRMADA / REABERTA".
2. Inclua o método de ver o uso real sem acessar dados privados: pedir ao amigo o CSV exportado no 7º dia (com autorização dele) e uma captura de tela da tela inicial com os totais do mês.

## Arquivos a criar ou alterar
- `docs/roteiro-retorno.md`

## Critério de pronto (verificável)
- [ ] O arquivo existe e a tabela (d) tem uma linha para cada uma das 6 suposições de 7.3.
- [ ] `grep -ci "3º dia\|terceiro dia" docs/roteiro-retorno.md` maior que 0, e o mesmo para "7º dia".

## Cuidados
- Perguntas simples, sem jargão. Pedir autorização antes de olhar qualquer dado do amigo. Não commitar; proponha a mensagem.

## Resultado
Criado `docs/roteiro-retorno.md` com: (a) contatos no 3º e 7º dia; (b) 4 perguntas do 3º dia; (c) 17 perguntas do 7º dia em linguagem simples; (d) tabela com as 6 suposições de 7.3 (mais 3 linhas extras para as suposições de 6.3); método de ver o uso real sem acessar dados privados (autorização, CSV, captura da tela inicial, nada no repositório público); tabelas de registro das respostas. `docs/respostas-entrevista.md` não existe (entrevista não ocorreu); usados o roteiro da entrevista e a seção 7.3.

Verificação: grep "3º dia" = 5 ocorrências; grep "7º dia" = 5 ocorrências; tabela (d) com 6 linhas numeradas de 1 a 6.

Não commitado. Mensagem proposta: "Adiciona roteiro de retorno após uma semana de uso". Sugestão: incluir `roteiro-retorno.md` no `docs/INDICE.md` (fora do escopo desta tarefa).
