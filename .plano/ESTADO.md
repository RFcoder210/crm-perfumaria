# Estado do projeto

Diagnóstico de 2026-09-29 (arquiteto). Nenhuma tarefa do plano foi iniciada.

## O que já existe
- `index.html` (837 linhas): aplicação completa em arquivo único. Leads com funil de 6 etapas independentes, vendas, botão "Lançar em vendas", busca sem acento, exportação de CSV (com BOM UTF-8 e separador `;`, seções LEADS e VENDAS), totais do mês, dados em `localStorage` (chave `crm-perfumes:dados`) com tratamento de três erros (armazenamento bloqueado, dados ilegíveis, falha ao gravar).
- `teste.js` com jsdom: 26 testes, `npm test` passa hoje (verificado pelo arquiteto em 2026-09-29).
- `TESTES.md`: roteiro manual, nenhuma caixa marcada; a seção final manda rodar `node teste.js` em vez de `npm test`.
- Git local com histórico de commits; branch `main`; sem remoto configurado (`git remote -v` vazio).
- Sistema de agentes em `.claude/` e `.plano/`.
- Ambiente: Node 24.19, Git 2.55 com Credential Manager 2.9, Python 3.14.6. GitHub CLI (`gh`) não instalado. Não existe pasta `docs/`.

## O que funciona
Testes automáticos (jsdom) passam. Roteiro manual foi rodado no navegador do computador (informado pelo desenvolvedor), sem registro item a item.

## O que falta
- Teste no celular e permanência dos dados após fechar e reabrir o navegador (pendência principal).
- Teste automatizado do conteúdo do CSV e conferência do CSV no Excel/Sheets.
- Regra atual do Safari sobre limpeza de dados e proteção escolhida.
- Entrevista com o perfumista (todos os requisitos são SUPOSIÇÃO).
- Decisão do endereço definitivo; conta e repositório no GitHub; publicação; ativação do Pages.
- Guia de uso, entrega, semana de uso real, ajustes de campos, atualização do `CLAUDE.md`.

## Riscos
- Entrevista que já falhou uma vez; suposições sem confirmação (seção 7 do `CLAUDE.md`).
- Dados presos ao navegador e ao endereço; sem importação de CSV; limpeza automática do Safari.
- Repositório público publicaria `CLAUDE.md`, `.plano/`, `.claude/`; o e-mail pessoal do desenvolvedor já consta nos commits.
- Arquivos soltos não versionados: `.claude - Copia/`, `CLAUDE - Copia.md` (não tocar).
- Dias de trabalho não definidos: sem datas possíveis.

## Decisões pendentes do usuário
Ver `.plano/PLANO.md`, seção 6.

## Tabela de tarefas

Legenda: (U) = AGUARDA USUÁRIO (o passo depende do desenvolvedor ou de terceiro; nenhum agente pode executá-lo ou assumi-lo). Condicional = pode ser encerrada como "sem ação" conforme o resultado da anterior.

| ID | Título | Status | Depende de |
|---|---|---|---|
| T01 | Verificar a base e alinhar o TESTES.md | CONCLUIDA | nenhuma |
| T02 | Remover páginas não usadas do teste.js | CONCLUIDA | T01 |
| T03 | Teste automatizado do conteúdo do CSV | CONCLUIDA | T02 |
| T04 | Guia para abrir o sistema no celular | CONCLUIDA | T01 |
| T05 | (U) AGUARDA USUÁRIO: roteiro completo no celular e CSV no Excel/Sheets | CONCLUIDA | T03, T04 |
| T06 | Registrar o resultado do teste no celular | CONCLUIDA | T05 |
| T07 | Corrigir falhas do celular (condicional) | CONCLUIDA | T06 |
| T08 | Pesquisar regra do Safari e opções de proteção | CONCLUIDA | nenhuma |
| T09 | (U) AGUARDA USUÁRIO: decidir a proteção de dados | CONCLUIDA | T08 |
| T10 | Aplicar a proteção aprovada (condicional) | CONCLUIDA | T09 |
| T11 | Preparar o roteiro da entrevista | CONCLUIDA | nenhuma |
| T12 | (U) AGUARDA USUÁRIO: realizar a entrevista | PENDENTE | T11 |
| T13 | Registrar respostas da entrevista e propor atualização do CLAUDE.md | PENDENTE | T12 |
| T14 | (U) AGUARDA USUÁRIO: decidir o endereço definitivo | CONCLUIDA | T11 (T13 se houve entrevista) |
| T15 | Auditar o que ficará público | CONCLUIDA | T14 |
| T16 | Criar o README.md | CONCLUIDA | T15 |
| T17 | (U) AGUARDA USUÁRIO: conta GitHub, repositório vazio, cenário | CONCLUIDA | T14, T15, T16 |
| T18 | (U) AGUARDA USUÁRIO: confirmar e enviar o código ao GitHub | CONCLUIDA | T17, T07 |
| T19 | (U) AGUARDA USUÁRIO: ativar o GitHub Pages e verificar | CONCLUIDA | T18 |
| T20 | (U) AGUARDA USUÁRIO: subdomínio do amigo (condicional, só opção B) | CONCLUIDA | T19 |
| T21 | (U) AGUARDA USUÁRIO: retestar no celular no endereço publicado | PENDENTE | T19 (T20) |
| T22 | Escrever o guia de uso para o perfumista | PENDENTE | T19, T10 |
| T23 | Preparar o roteiro de retorno de uma semana | CONCLUIDA | T13 (ou T11) |
| T24 | (U) AGUARDA USUÁRIO: entregar ao perfumista | PENDENTE | T21, T22, T23 |
| T25 | (U) AGUARDA USUÁRIO: acompanhar a semana de uso (7 dias corridos) | PENDENTE | T24 |
| T26 | Consolidar o retorno e listar ajustes de campos | PENDENTE | T25 |
| T27 | Aplicar ajustes de campos aprovados (condicional) | PENDENTE | T26 |
| T28 | Fechamento: critérios e proposta final para o CLAUDE.md | PENDENTE | T26, T27 |
