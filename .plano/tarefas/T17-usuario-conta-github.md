# T17 — AGUARDA USUÁRIO: conta no GitHub, repositório vazio e escolha do cenário de publicação

**Fase:** 5 — Publicação
**Porte:** P (cerca de 30 a 45 min do desenvolvedor)
**Depende de:** T14, T15, T16
**Executor:** AGUARDA USUÁRIO (login e criação de conta só o desenvolvedor pode fazer)

## Contexto mínimo
Ainda não está confirmado que existe conta e repositório no GitHub (OBJETIVO). Nenhum agente cria conta, digita senha nem publica nada. O GitHub é o "depósito na nuvem" do código; o GitHub Pages transforma o conteúdo do depósito em site. A ferramenta `gh` (GitHub CLI) NÃO está instalada; o plano usa o `git` comum com o navegador para autenticar, sem precisar do `gh`.

## Arquivos para ler
- `docs/auditoria-publicacao.md` (cenários e recomendação)
- Resultado da T14 (nome do repositório e visibilidade)

## O que fazer (o desenvolvedor)
1. Entrar na conta do GitHub (ou criar uma gratuita em github.com). Ativar verificação em duas etapas se ainda não tiver.
2. Escolher um dos três cenários da auditoria (T15) e informar ao orquestrador. Se escolher o cenário 2 ou 3, registrar: o preparo do conteúdo será feito por uma tarefa adicional inserida pelo orquestrador antes da T18.
3. Criar, no site do GitHub, um repositório VAZIO com o nome definido na T14 e a visibilidade Pública, sem marcar "Add a README", sem `.gitignore` e sem licença (para não haver conflito com o repositório local).
4. Informar ao orquestrador o endereço do repositório (`https://github.com/USUARIO/NOME.git`) e o nome de usuário.
5. Confirmar que o `git` do computador consegue autenticar: na T18, ao enviar, abrirá uma janela do navegador para login (Git Credential Manager). O desenvolvedor faz o login nela. Nunca colar senha ou token em arquivo ou no chat.

## Arquivos a criar ou alterar
- Nenhum.

## Critério de pronto (verificável)
- [ ] O Resultado registra: usuário GitHub, endereço do repositório vazio, visibilidade e cenário escolhido.
- [ ] Abrir o endereço do repositório no navegador mostra o repositório vazio (conferido pelo desenvolvedor).

## Cuidados
- Nenhuma senha, token ou chave é registrada em qualquer arquivo do projeto.

## Resultado
Concluída em 2026-09-30:
- Usuário GitHub: RFcoder210.
- Repositório: https://github.com/RFcoder210/crm-perfumaria.git (público, vazio; conferido pela API pública: private=false, size=0, sem commits).
- Cenário escolhido: 1 (público com tudo), com a autoria dos commits reescrita para o e-mail noreply do GitHub, mantendo o histórico.
- Endereço final esperado: https://rfcoder210.github.io/crm-perfumaria/
- Cópia de segurança do .git anterior: fora do projeto, em ../crm-perfumaria-backup-git-2026-09-30 (não enviar).
- Nenhum envio feito. T18 exige a frase "CONFIRMO enviar ao GitHub".
