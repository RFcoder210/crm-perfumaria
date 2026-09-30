# T18 — AGUARDA USUÁRIO: confirmar e enviar o código ao GitHub

**Fase:** 5 — Publicação
**Porte:** P
**Depende de:** T17 (e T06/T07 para o código estar corrigido; T10 se houver proteção aprovada)
**Executor:** executor-tarefa, SOMENTE depois de confirmação explícita do desenvolvedor (AGUARDA USUÁRIO)

## Contexto mínimo
Regra do projeto: nada é publicado na internet sem confirmação explícita do desenvolvedor. "Enviar" (`git push`) copia o histórico de commits do computador para o depósito no GitHub. Depois disso, o conteúdo enviado fica visível publicamente (repositório público) e o histórico não é facilmente desfeito.

## Arquivos para ler
- Resultado da T17 (endereço do repositório, cenário)
- `docs/auditoria-publicacao.md`

## O que fazer
1. O orquestrador mostra ao desenvolvedor: lista dos arquivos que serão enviados (`git ls-files`), e-mail que aparece nos commits (`git log --format=%ae | sort -u`) e o endereço do repositório de destino. Pede a frase de confirmação: "CONFIRMO enviar ao GitHub". Sem essa frase, esta tarefa não avança.
2. Verifique `git status --short`: sem alterações não commitadas nos arquivos que serão publicados (o desenvolvedor já confirmou os commits das tarefas anteriores). Confirmar `npm test` passando.
3. Com a confirmação: `git remote add origin URL`, `git branch -M main` (se necessário) e `git push -u origin main`. O desenvolvedor faz o login na janela do navegador que abrir.
4. Confirmar o envio: `git ls-remote origin` mostra o hash do último commit local (`git rev-parse HEAD`).

## Arquivos a criar ou alterar
- Nenhum arquivo do projeto (apenas a configuração do remoto no `.git`).

## Critério de pronto (verificável)
- [ ] `git ls-remote origin main` e `git rev-parse HEAD` retornam o mesmo hash.
- [ ] O desenvolvedor confirmou abrindo o repositório no navegador e vendo os arquivos.

## Cuidados
- Sem `--force`. Sem confirmação, devolver PENDENTE com a nota "AGUARDA USUÁRIO: confirmação".
- Se a autenticação falhar, não pedir nem registrar senha ou token; orientar o login pelo navegador.
- Arquivos "Copia" não versionados ficam de fora; não os adicione.

## Resultado
Concluída em 2026-09-30, após a confirmação escrita do desenvolvedor.
- Antes do envio: árvore limpa, `npm test` passando, 66 arquivos versionados, todos os commits com o e-mail noreply do GitHub, nenhuma ocorrência de e-mail pessoal ou do nome do perfumista nos arquivos nem no histórico.
- Remoto: https://github.com/RFcoder210/crm-perfumaria.git; `git push -u origin main` sem `--force`; login feito pelo desenvolvedor no navegador.
- Verificação: `git ls-remote origin main` e `git rev-parse HEAD` retornam o mesmo hash (03731b5 no momento do envio). A API pública confirma repositório público e o e-mail noreply no último commit.
- Falta: o desenvolvedor abrir https://github.com/RFcoder210/crm-perfumaria no navegador e ver os arquivos.
