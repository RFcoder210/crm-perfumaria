# Plano — CRM Perfumaria

Gerado em 2026-09-29 pelo agente arquiteto. Fonte: `.plano/OBJETIVO.md` e `CLAUDE.md`.

## 1. Resumo do objetivo

Sistema de controle de leads e vendas de perfumes em arquivo único (HTML, CSS e JavaScript puros), publicado gratuitamente no GitHub Pages, testado no celular e entregue ao perfumista autônomo, com uma semana de uso real acompanhada e ajustes de campos conforme o retorno dele. O código já funciona e tem 26 testes automáticos passando; falta validar no celular, decidir o endereço, publicar, entregar e colher o retorno. Testes com Playwright ficam para depois (fora deste plano).

### Critérios de conclusão
1. O roteiro do `TESTES.md` passa inteiro em navegador real e no celular, e `npm test` passa.
2. Os dados sobrevivem a recarregar a página e a fechar e reabrir o navegador, no celular.
3. Publicado no GitHub Pages, em endereço definitivo decidido antes da entrega.
4. O CSV exportado abre no Excel ou Google Sheets com a acentuação correta.
5. Entregue ao usuário final, com a rotina semanal de exportar o CSV explicada.
6. Uma semana de uso real acompanhada e o retorno registrado no `CLAUDE.md` (itens da seção 7.3 movidos para CONFIRMADO ou reabertos).

### Prazo e disponibilidade
- Sem prazo fixo. Sem datas neste plano (o agente de cronograma não deve inventar datas).
- Disponibilidade: 3 horas por dia de trabalho. **Os dias da semana em que o desenvolvedor trabalha NÃO estão definidos: decisão pendente do desenvolvedor.** Sem isso, o plano se expressa em "dias de trabalho de 3 h", e o cronograma em datas só pode ser gerado depois dessa definição.
- Estimativa de esforço: cerca de 13 h de agentes (17 tarefas P e 3 M, com margem para as condicionais) e cerca de 7 h do desenvolvedor em passos que dependem dele. Total de 8 a 10 dias de trabalho de 3 h, mais esperas externas: a semana de uso (7 dias corridos, T25), a entrevista (depende da agenda do amigo) e, se houver subdomínio, a propagação do domínio.
- Plano do Claude: Pro (cota limitada por janela de horas). Tarefas foram mantidas em P e M para caber em uma janela; evitar rodar mais de 2 tarefas M seguidas.

## 2. Pré-requisitos do ambiente (para o agente `preparacao-terreno`)

Verificar antes de instalar; quase tudo já existe.

| Item | Verificação | Situação conhecida | Ação |
|---|---|---|---|
| Node.js 24 | `node -v` (esperado v24.x) | OK (v24.19.0) | nenhuma |
| npm e jsdom ^24 | `npm ls jsdom` e `npm test` | OK (26 testes passam) | se `node_modules` faltar, `npm install` |
| Git 2.x | `git --version` | OK (2.55.0) | nenhuma |
| Git Credential Manager (login no GitHub pelo navegador) | `git credential-manager --version` | OK (2.9.0) | nenhuma |
| Python 3.14 (servidor local para o celular) | `py --version` e `py -m http.server --help` | OK (3.14.6) | nenhuma; não criar `.venv` (projeto não usa Python) |
| Pasta `docs/` e `docs/INDICE.md` | `ls docs` | NÃO existe | criar `docs/` com `INDICE.md` (lista de cada documento e para que serve; os agentes vão criar arquivos ali: `pesquisa-armazenamento.md`, `roteiro-entrevista.md`, `respostas-entrevista.md`, `auditoria-publicacao.md`, `guia-do-usuario.md`, `roteiro-retorno.md`, `retorno-semana.md`, `proposta-claude-md-final.md`) |
| `.plano/estado/AMBIENTE.md` | existe o arquivo | NÃO existe | criar registrando os itens acima |
| GitHub CLI (`gh`) | `gh --version` | NÃO instalado | NÃO instalar: o plano usa `git` + Credential Manager. Opcional, só com aprovação explícita |
| Conta GitHub, repositório, login | n/a | não confirmado | AGUARDA USUÁRIO (T17); nenhum agente cria conta nem manipula senha |
| Celular na mesma rede Wi-Fi e regra do Firewall do Windows para o Python | n/a | não verificável por agente | AGUARDA USUÁRIO (T05) |
| Playwright | n/a | fora de escopo | não instalar |

Organização de pastas: documentos de apoio em `docs/`; planejamento em `.plano/`; código permanece na raiz (`index.html`, `teste.js`, `TESTES.md`, `package.json`). Não mover nem apagar os arquivos soltos `.claude - Copia/` e `CLAUDE - Copia.md` (não versionados, pertencem ao usuário).

Skills: nenhuma nova é necessária.

## 3. Regras de operação do plano

- Mudanças no `index.html` seguem o roteiro do comando `/funcionalidade` (`.claude/commands/funcionalidade.md`).
- Um commit pequeno por alteração, mensagem em português. Executores NÃO commitam: propõem a mensagem no Resultado e o orquestrador pede confirmação ao desenvolvedor. (Decisão pendente de confirmação, ver seção 6.)
- Nada é enviado à internet sem a frase explícita de confirmação do desenvolvedor (T18 e qualquer novo envio).
- `CLAUDE.md` só é editado com confirmação; agentes apenas propõem o texto.
- Passos que dependem do usuário aparecem como AGUARDA USUÁRIO e nunca são assumidos.
- Ideias fora da ordem (lembrete de recompra, lucro, gráficos, estoque, cadastro de produtos, importar CSV) ficam registradas, não implementadas.

## 4. Fases e tarefas

Porte: P até 30 min de agente; M até 1 h30. Nenhuma tarefa G. "(U)" marca passo que depende do usuário.

### Fase 1 — Base local
| ID | Tarefa | Porte | Depende de |
|---|---|---|---|
| T01 | Verificar a base (npm test) e alinhar o comando no TESTES.md | P | nenhuma |
| T02 | Remover páginas não usadas do teste.js | P | T01 |
| T03 | Teste automatizado do conteúdo do CSV | P | T02 |
| T04 | Guia para abrir o sistema no celular (servidor local) | P | T01 |

### Fase 2 — Teste no celular
| ID | Tarefa | Porte | Depende de |
|---|---|---|---|
| T05 | (U) Rodar o roteiro completo no celular e abrir o CSV no Excel/Sheets | M | T03, T04 |
| T06 | Registrar o resultado no TESTES.md e listar falhas | P | T05 |
| T07 | Corrigir falhas do celular (condicional) | M | T06 |

### Fase 3 — Proteção dos dados
| ID | Tarefa | Porte | Depende de |
|---|---|---|---|
| T08 | Pesquisar a regra de limpeza de dados do Safari e opções de proteção | P | nenhuma |
| T09 | (U) Decidir a proteção a aplicar | P | T08 |
| T10 | Aplicar a proteção aprovada (condicional) | P | T09 |

### Fase 4 — Requisitos e endereço
| ID | Tarefa | Porte | Depende de |
|---|---|---|---|
| T11 | Preparar o roteiro da entrevista | P | nenhuma |
| T12 | (U) Realizar a entrevista com o perfumista | M | T11 |
| T13 | Registrar as respostas e propor a atualização do CLAUDE.md | P | T12 |
| T14 | (U) Decidir o endereço definitivo | P | T11 (e T13 se a entrevista ocorreu) |

### Fase 5 — Publicação
| ID | Tarefa | Porte | Depende de |
|---|---|---|---|
| T15 | Auditar o que ficará público no repositório | P | T14 |
| T16 | Criar o README.md | P | T15 |
| T17 | (U) Conta GitHub, repositório vazio e escolha do cenário de publicação | P | T14, T15, T16 |
| T18 | (U) Confirmar e enviar o código ao GitHub | P | T17, T07 |
| T19 | (U) Ativar o GitHub Pages e verificar o endereço | P | T18 |
| T20 | (U) Apontar subdomínio do amigo (condicional: só opção B) | M | T19 |
| T21 | (U) Repetir o teste no celular no endereço publicado | M | T19 (e T20) |

### Fase 6 — Entrega
| ID | Tarefa | Porte | Depende de |
|---|---|---|---|
| T22 | Escrever o guia de uso para o perfumista | M | T19, T10 |
| T23 | Preparar o roteiro de retorno após uma semana | P | T13 (ou T11) |
| T24 | (U) Entregar o sistema ao perfumista | M | T21, T22, T23 |

### Fase 7 — Semana de uso real e fechamento
| ID | Tarefa | Porte | Depende de |
|---|---|---|---|
| T25 | (U) Acompanhar a semana de uso e coletar o retorno (7 dias corridos) | M | T24 |
| T26 | Consolidar o retorno e listar os ajustes de campos | P | T25 |
| T27 | Aplicar os ajustes de campos aprovados (condicional) | M | T26 |
| T28 | Fechamento: conferir critérios e propor atualização do CLAUDE.md | P | T26, T27 |

Trabalho em paralelo possível (dias distintos, sem conflito de arquivo): T08 e T11 podem ser feitos a qualquer momento; a entrevista (T12) deve ser agendada cedo porque depende de terceiro.

Ordem sugerida de execução: T01, T02, T03, T04, T05 (U), T06, T07, T08, T11, T09 (U), T10, T12 (U) em paralelo à espera, T13, T14 (U), T15, T16, T17 (U), T18 (U), T19 (U), T20 (U, se B), T21 (U), T22, T23, T24 (U), T25 (U), T26, T27, T28.

## 5. Riscos principais e contingência

| Risco | Efeito | Contingência |
|---|---|---|
| A entrevista não acontece (já ocorreu uma vez) | Entrega baseada em suposições | Seguir até a publicação sem ela; na T24 o desenvolvedor aceita o risco explicitamente e o amigo é avisado; a semana de uso (T25) cumpre parte do papel da entrevista |
| Respostas reabrem decisões (mais de um usuário, parcelamento, cadastro de produtos) | Modelo de dados ou hospedagem pode mudar | T13 sinaliza e recomenda replanejamento; o orquestrador reinvoca o arquiteto |
| Perda de dados por limpeza do Safari, troca de celular ou limpeza do navegador | Perfumista perde histórico | T08/T09/T10 (proteção) e rotina semanal de CSV no guia (T22); importação de CSV registrada como candidata fora da ordem |
| Trocar de endereço depois da entrega abre o sistema vazio (não há importação) | Perda de dados | Endereço decidido antes (T14); evitar mudança de nome do repositório depois |
| Repositório público expõe conteúdo interno (`CLAUDE.md`, `.plano/`) e o e-mail pessoal do autor dos commits | Exposição de dados pessoais | T15 audita e propõe cenários; T18 só com confirmação explícita. O e-mail do desenvolvedor já aparece no histórico (`git log`) |
| Falha no teste local no celular (Firewall, rede) | T05 travada | T04 documenta o Firewall; alternativa: publicar primeiro em endereço de teste, só com confirmação, e testar lá |
| `localStorage` do domínio `github.io` é compartilhado entre repositórios do mesmo usuário | Colisão de dados (baixo, chave com prefixo `crm-perfumes:`) | Manter o prefixo da chave; não hospedar outro sistema com a mesma chave |
| Cota do plano Pro esgotada durante o dia | Tarefa interrompida | Tarefas pequenas (P/M); registrar estado em `ESTADO.md`; retomar pela tarefa |
| Ajustes pós-uso maiores que o previsto | T27 estoura | T26 divide em ajustes pequenos; T27 devolve PENDENTE e pede replanejamento |
| Dias de trabalho não definidos | Cronograma sem datas | Decisão pendente do desenvolvedor (seção 6) |
| Risco residual de backup: sem importação de CSV (opção 4 da T09, não implementada) | Mesmo com o aviso de cópia (T10), trocar de aparelho ou de endereço, ou limpar o navegador, ainda perde os dados, porque o CSV não volta para o sistema | Aviso de backup aplicado na T10; decidir a importação de CSV depois da entrevista e da semana de uso |

### Ideias fora da ordem (registradas, não implementadas)

- **Relatório mensal de vendas / fechamento do mês.** Limitação: o campo `valor` é texto livre e opcional (pode vir como "150", "R$ 150", "150,00" ou vazio), então somar exige decidir o formato antes (por exemplo, aceitar só números ou normalizar vírgula e "R$"). Decidir depois da entrevista (pergunta 12 do `docs/roteiro-entrevista.md`) e da semana de uso real. Hoje o topo da tela já soma o total do mês, só com valores numéricos.

## 6. Decisões que dependem do usuário

1. **Dias da semana de trabalho** (só se sabe: 3 h por dia de trabalho). Necessário para o cronograma em datas.
2. **Executores commitam?** Padrão do plano: não; propõem a mensagem e o orquestrador pede confirmação (coerente com `CLAUDE.md`, seção 2). Confirmar ou trocar.
3. **Endereço definitivo** (T14): A, GitHub Pages padrão (recomendado); B, subdomínio do site do amigo; C, pasta do site (não recomendado). Nome do repositório e visibilidade pública.
4. **Cenário de publicação** (T17): o que ficará visível no repositório público.
5. **Proteção de dados** (T09): quais opções aplicar.
6. **Ajustes de campos** (T26/T27): quais aprovar.
7. Arquivos soltos `.claude - Copia/` e `CLAUDE - Copia.md` na raiz: manter, mover ou apagar (só o desenvolvedor decide; nenhum agente os toca).
