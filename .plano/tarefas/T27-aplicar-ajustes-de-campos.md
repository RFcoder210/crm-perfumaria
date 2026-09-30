# T27 — Aplicar os ajustes de campos aprovados (condicional)

**Fase:** 7 — Semana de uso real
**Porte:** M
**Depende de:** T26 (e aprovação do desenvolvedor dos ajustes)
**Executor:** executor-tarefa

## Contexto mínimo
Última etapa de código do objetivo: ajustar campos conforme o retorno do perfumista. O escopo só é conhecido após a T26. Esta tarefa cobre no máximo os ajustes de prioridade alta e de porte P que o desenvolvedor aprovar. Se nenhum ajuste foi aprovado, marque CONCLUIDA com "sem ajustes". Se o total aprovado passar de M, devolva PENDENTE pedindo replanejamento (o orquestrador reinvoca o arquiteto).

## Arquivos para ler
- `docs/retorno-semana.md` (seção "Ajustes de campos propostos") e a aprovação registrada pelo orquestrador no Resultado desta tarefa
- `.claude/commands/funcionalidade.md`
- `CLAUDE.md` (seções 4, 5, 6, 9)
- `index.html` (trechos afetados, via Grep), `teste.js`, `TESTES.md`

## O que fazer
1. Para cada ajuste aprovado, um por vez, seguir o roteiro do `/funcionalidade`: entender, localizar no `index.html`, planejar, implementar, verificar.
2. Se o ajuste mudar o formato dos dados, garantir que os dados já salvos (chave `crm-perfumes:dados`) continuem sendo lidos: campo novo sempre com valor padrão quando ausente. Incluir teste que carrega um registro antigo (sem o campo) e confirma que abre normalmente.
3. Atualizar o `TESTES.md` e o `teste.js`.
4. Rodar `npm test`.
5. Listar no Resultado os itens que o desenvolvedor deve conferir no celular e no endereço publicado.

## Arquivos a criar ou alterar
- `index.html`, `teste.js`, `TESTES.md`

## Critério de pronto (verificável)
- [ ] `npm test` passa, incluindo o teste com registro antigo, quando houver mudança de dados.
- [ ] Cada ajuste aprovado tem uma linha "feito" no Resultado.
- [ ] A conferência manual no celular fica registrada como AGUARDA USUÁRIO.

## Cuidados
- Sem framework nem build. Um commit por ajuste, mensagem em português, só com confirmação.
- A publicação da nova versão exige nova confirmação explícita do desenvolvedor (mesmo procedimento da T18).
- Não implementar ideias fora da ordem.

## Resultado
(preenchido pelo executor)
