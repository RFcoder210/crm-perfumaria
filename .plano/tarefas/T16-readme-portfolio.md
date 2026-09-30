# T16 — Criar o README.md do repositório

**Fase:** 5 — Publicação
**Porte:** P
**Depende de:** T15
**Executor:** executor-tarefa

## Contexto mínimo
O projeto serve também como portfólio do desenvolvedor. O README é a vitrine do repositório no GitHub. Deve explicar o que é, como usar, como testar e como rodar localmente, em português, sem expor informação sensível apontada pela auditoria (T15).

## Arquivos para ler
- `CLAUDE.md` (seções 1, 3, 4, 5)
- `docs/auditoria-publicacao.md`
- `package.json`
- `TESTES.md`

## O que fazer
1. Crie `README.md` na raiz com as seções: o que é (3 linhas, sem citar o nome ou detalhes pessoais do amigo); funcionalidades (leads com funil de 6 etapas, vendas, busca sem acento, exportar CSV, dados no navegador); como usar (endereço publicado: deixar o marcador `ENDERECO-A-PREENCHER-NA-T19`); como rodar localmente (`py -m http.server 8000` e abrir `http://localhost:8000`); como testar (`npm install` e `npm test`); decisões de projeto (arquivo único, JavaScript puro, sem build; por quê, em 2 linhas); limitações conhecidas (dados apenas no aparelho, backup por CSV); estado do projeto.
2. Não copie o `CLAUDE.md` inteiro: ele é instrução interna.

## Arquivos a criar ou alterar
- `README.md`

## Critério de pronto (verificável)
- [ ] `README.md` existe e contém as seções listadas (`grep -c "^## " README.md` maior ou igual a 6).
- [ ] Contém o marcador `ENDERECO-A-PREENCHER-NA-T19` exatamente uma vez.
- [ ] Nenhum telefone ou e-mail pessoal aparece (`grep -nE "@|[0-9]{4}-[0-9]{4}" README.md` sem resultado indevido).

## Cuidados
- Português do Brasil, linguagem simples. Não commitar; proponha a mensagem (sugestão: "Adiciona o README com instruções de uso e de teste").

## Resultado
Status: CONCLUIDA (30/09/2026).

Criado `README.md` na raiz com 7 seções (`##`): Funcionalidades, Como usar, Como rodar localmente, Como testar, Decisões de projeto, Limitações conhecidas, Estado do projeto, mais introdução de 3 linhas sem dados do amigo. Não cita o usuário do GitHub nem e-mail (endereço publicado ficou como marcador).

Verificação:
- `grep -c "^## " README.md` = 7 (mínimo 6).
- `grep -c "ENDERECO-A-PREENCHER-NA-T19" README.md` = 1.
- `grep -nE "@|[0-9]{4}-[0-9]{4}" README.md` sem resultado.

Não commitado. Mensagem sugerida: "Adiciona o README com instruções de uso e de teste".
