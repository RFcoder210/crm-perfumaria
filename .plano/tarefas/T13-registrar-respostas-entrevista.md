# T13 — Registrar as respostas da entrevista e propor a atualização do CLAUDE.md

**Fase:** 4 — Requisitos e endereço
**Porte:** P
**Depende de:** T12
**Executor:** executor-tarefa

## Contexto mínimo
O `CLAUDE.md` separa itens CONFIRMADO de SUPOSIÇÃO (seções 6.2, 6.3, 7.2, 7.3). Depois da entrevista, cada resposta deve mover uma suposição para CONFIRMADO ou reabrir a decisão. Somente o desenvolvedor autoriza a mudança no `CLAUDE.md`.

## Arquivos para ler
- `.plano/tarefas/T12-usuario-entrevista.md` (Resultado)
- `docs/roteiro-entrevista.md`
- `CLAUDE.md` (seções 6 e 7)

## O que fazer
1. Crie `docs/respostas-entrevista.md` com as respostas fielmente transcritas, por pergunta.
2. Crie, no mesmo arquivo, a tabela "Suposição | Resposta | Consequência | Ação sugerida", com uma linha por suposição de 6.3 e 7.3. Classifique cada uma como CONFIRMADA, REABERTA (a resposta contraria) ou SEM RESPOSTA.
3. Para cada suposição REABERTA, indique o impacto (por exemplo: se mais de uma pessoa usa, os dados no navegador não bastam; se vende parcelado, o modelo de dados muda) e se o item vira nova tarefa ou fica fora da ordem de trabalho (`CLAUDE.md`, seção 8).
4. Escreva o texto exato proposto para as seções 6.2/6.3/7.2/7.3 do `CLAUDE.md` em um bloco "Proposta de atualização" (NÃO aplicar).

## Arquivos a criar ou alterar
- `docs/respostas-entrevista.md`

## Critério de pronto (verificável)
- [ ] O arquivo tem a tabela com todas as suposições de 6.3 e 7.3 classificadas.
- [ ] Contém o bloco "Proposta de atualização" com o texto pronto para colar.
- [ ] `git diff --stat CLAUDE.md` está vazio.

## Cuidados
- Se alguma resposta reabrir uma decisão técnica de 6.1 (por exemplo, exigir servidor ou login), apenas sinalize no Resultado e recomende um replanejamento; não decida.
- Não commitar; proponha a mensagem.

## Resultado
(preenchido pelo executor)
