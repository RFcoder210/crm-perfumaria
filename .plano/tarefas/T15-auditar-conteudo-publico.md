# T15 — Auditar o que vai ficar público no repositório

**Fase:** 5 — Publicação
**Porte:** P
**Depende de:** T14
**Executor:** executor-tarefa

## Contexto mínimo
O GitHub Pages gratuito exige repositório público em conta gratuita: tudo o que for enviado (o código, e também `CLAUDE.md`, `.plano/`, `.claude/`, `TESTES.md`, `docs/`) poderá ser lido por qualquer pessoa. Antes de qualquer envio (T18), é preciso saber exatamente o que sairia e se há dado sensível: nomes reais de clientes, telefones, e-mail pessoal, chaves ou senhas, detalhes do amigo que ele não autorizou expor.

## Arquivos para ler
- `.gitignore`
- Resultado de `git ls-files` (lista dos arquivos versionados)
- `CLAUDE.md`, `.plano/OBJETIVO.md`, `docs/` (procurar informação pessoal)

## O que fazer
1. Rode `git ls-files` e `git status --short`. Os itens `.claude - Copia/` e `CLAUDE - Copia.md` não estão versionados: confirme que não seriam enviados (não apague nada).
2. Procure com Grep, em todos os arquivos versionados, padrões de segredo e dado pessoal: `senha|password|token|secret|api[_-]?key|@gmail|@hotmail|\b\d{2}\s?9?\d{4}-?\d{4}\b` (telefones), CPF (`\d{3}\.\d{3}\.\d{3}-\d{2}`).
3. Verifique o histórico do Git: `git log -p --all -S"@gmail" --oneline | head` (e-mail do autor dos commits aparece em qualquer repositório público; registre qual e-mail está nos commits com `git log --format=%ae | sort -u`).
4. Crie `docs/auditoria-publicacao.md` com: lista de arquivos que seriam públicos; achados (arquivo, linha, tipo, gravidade); e três cenários de publicação para o desenvolvedor escolher: (1) repositório público com tudo; (2) repositório público sem `.plano/` e `.claude/` (adicionando-os ao `.gitignore` do repositório publicado, o que exige cuidado por já estarem versionados); (3) publicar só o `index.html`, o `README.md` e o `TESTES.md`. Indicar prós e contras de cada um em uma linha. Recomendar um.

## Arquivos a criar ou alterar
- `docs/auditoria-publicacao.md`

## Critério de pronto (verificável)
- [ ] O arquivo existe com as seções "Arquivos versionados", "Achados", "Cenários" e "Recomendação".
- [ ] `git status --short` não mostra alteração em outros arquivos além dos novos de `docs/`.

## Cuidados
- Não remova arquivos nem altere o histórico do Git. Não configure remoto e não envie nada.
- Mostre trechos sensíveis mascarados no relatório.
- Não commitar; proponha a mensagem.

## Resultado
Concluída em 2026-09-30. Criado `docs/auditoria-publicacao.md` (seções Arquivos versionados, Achados, Cenários, Recomendação). Nada foi removido, configurado nem enviado.
- Nenhum segredo, CPF ou telefone real nos arquivos. Única exposição relevante: e-mail pessoal do Gmail nos metadados dos 21 commits (autor e committer), que ficaria público. Solução documentada: e-mail privado/noreply do GitHub + recomeçar o histórico limpo antes do primeiro envio (ainda não há remoto).
- Itens `.claude - Copia/` e `CLAUDE - Copia.md` não existem na pasta (conferido).
- Recomendação: cenário 1 (público com tudo), condicionado ao tratamento do e-mail e à revisão de `respostas-entrevista.md` e `retorno-semana.md` antes do envio.
- Verificação: `git status --short` mostra apenas `docs/auditoria-publicacao.md` como novo em `docs/`; os demais itens de `.plano/` já estavam alterados ou não rastreados antes da tarefa.
- Mensagem de commit proposta: "Adiciona auditoria do conteúdo que ficará público no repositório".
