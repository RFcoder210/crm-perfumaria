# Cronograma — 2026-09-30 (quarta-feira)

Prazo final: sem prazo fixo | Dias úteis restantes: indefinido | Situação: NO PRAZO
Progresso: 0 de 28 tarefas concluídas (0%) | Ambiente: PRONTO | Cota do dia: ~6 unidades

## Hoje — ordem de execução
| # | Tarefa | Agente | Porte | Depende de | Observação |
|---|---|---|---|---|
| 1 | T01 — Verificar a base e alinhar o TESTES.md | executor-tarefa | P | nenhuma | Rodar `npm test` (deve passar com 26 testes); corrigir comando em TESTES.md de `node teste.js` para `npm test` |
| 2 | T02 — Remover páginas não usadas do teste.js | executor-tarefa | P | T01 | Remover dom2, dom3, dom4; `npm test` deve passar com 26 testes (sem mudança na contagem) |
| 3 | T03 — Teste automatizado do conteúdo do CSV | executor-tarefa | P | T02 | Adicionar verificações do BOM UTF-8 (`﻿`), separador `;`, seções LEADS/VENDAS, acentuação e aspas |
| 4 | T04 — Guia para abrir o sistema no celular | executor-tarefa | P | T01 | Passo a passo com `py -m http.server 8000`, servidor local; pode iniciar em paralelo com T02 |
| 5 | T08 — Pesquisar regra do Safari e opções de proteção | pesquisador | P | nenhuma | Documentar em `docs/pesquisa-armazenamento.md`; pode rodar em paralelo |

**Total de hoje: 5 unidades (cabe na cota Pro de ~6 unidades/dia)**

## Se sobrar cota hoje
- T11 (P) — Preparar o roteiro da entrevista — pode iniciar se houver 1+ unidade disponível; documentar em `docs/roteiro-entrevista.md`

## Lembretes antecipados (próximos 7 dias)
| Quando | Tarefa | Criticidade | Ação recomendada |
|---|---|---|---|
| A partir de hoje | T05 (AGUARDA USUÁRIO) | ALTA | Teste no celular; desenvolvedor roda roteiro completo com servidor local; nenhuma data agendada |
| A partir de hoje | T12 (AGUARDA USUÁRIO) | CRÍTICA | Entrevista com perfumista; histórico: foi marcada e não aconteceu; priorizar agendamento assim que possível |
| Até 7 out | T14 (AGUARDA USUÁRIO) | ALTA | Decidir endereço definitivo (opção A: GitHub Pages; B: subdomínio; C: pasta do site) — necessário antes de T15/T16/T17 |
| A partir de T18 | Publicação | CRÍTICA | Requer confirmação explícita "CONFIRMO enviar ao GitHub" (restrição do projeto) |

## Próximos 3 dias úteis (previsão)

### Quinta, 2026-10-01 (sequência recomendada se T01-T04-T08 saírem hoje)
| # | Tarefa | Depende de | Porte | Nota |
|---|---|---|---|---|
| 1 | T05 (U) | T03, T04 | M | **AGUARDA USUÁRIO** — rodar roteiro completo no celular; testar persistência dos dados; abrir CSV no Excel/Sheets |
| 2 | T06 | T05 | P | Registrar resultado do teste no `TESTES.md` (caixa por caixa do roteiro) |
| 3 | T07 (cond.) | T06 | M | Condicional — corrigir falhas do celular só se houver em T05 |

**Carga estimada: 1 + 3 = 4 unidades (T05 é responsabilidade do desenvolvedor, não agente)**

### Sexta, 2026-10-02 (sequência recomendada se quinta concluir)
| # | Tarefa | Depende de | Porte | Nota |
|---|---|---|---|---|
| 1 | T09 (U) | T08 | P | **AGUARDA USUÁRIO** — decidir proteção de dados para Safari (resultado de T08) |
| 2 | T10 (cond.) | T09 | P | Condicional — aplicar proteção só se houver a implementar |
| 3 | T11 ou T13 | T01 / T12 | P | T11 pode sair se não tiver completado quinta; T13 se entrevista (T12) ocorrer |

**Carga estimada: 1-2 unidades**

### Segunda, 2026-10-05 (sequência recomendada se sexta concluir)
| # | Tarefa | Depende de | Porte | Nota |
|---|---|---|---|---|
| 1 | T14 (U) | T11, (T13) | P | **AGUARDA USUÁRIO** — decidir endereço definitivo (opção A, B ou C) |
| 2 | T15 | T14 | P | Auditar conteúdo público (CLAUDE.md, .plano/, .claude/, histórico de commits) |
| 3 | T16 | T15 | P | Criar `README.md` (públic) |
| 4 | T17 (U) | T14, T15, T16 | P | **AGUARDA USUÁRIO** — criar repositório GitHub vazio (público ou privado conforme T14) |

**Carga estimada: 3 unidades (T14, T17 são responsabilidade do desenvolvedor)**

## Estrutura de esperas externas
1. **T05 (teste no celular):** desenvolvedor, ~45 min a 1h de responsabilidade pessoal (rodar roteiro + testar persistência + abrir CSV). Bloqueante para T06, T07.
2. **T12 (entrevista com perfumista):** agendamento externo crítico; já falhou uma vez; recomenda-se contactar assim que possível. Desbloqueia T13. Pode correr em paralelo a outras tarefas durante a semana de espera.
3. **T25 (semana de uso real):** 7 dias corridos após T24 (entrega). Fornece retorno para T26/T27/T28.

## Alertas e restrições
- ⚠ **Sem data de conclusão definida:** o projeto segue em 7 fases (base local → celular → proteção de dados → requisitos → publicação → entrega → uso real). Cada fase: 3-5 dias úteis + esperas externas. **Estimativa total: 8-10 dias úteis de agentes + 1 semana de usuário (T25) + esperas da entrevista**.
- ⚠ **Entrevista crítica:** T12 já foi agendada e não ocorreu; segunda tentativa essencial. Se não acontecer, T24 segue com requisitos como SUPOSIÇÃO (risco registrado em PLANO.md, seção 5; usuário será avisado em T24).
- ⚠ **Commits:** propostos pelo executor, confirmados pelo desenvolvedor antes de executar (padrão em PLANO.md, seção 3; decisão pendente de confirmação).
- ⚠ **Publicação:** T18 e T19 requerem confirmação explícita "CONFIRMO enviar ao GitHub" (OBJETIVO.md, restrição inegociável).
- ⚠ **Ambiente:** todas as ferramentas confirmadas em `.plano/estado/AMBIENTE.md`; `docs/` e `docs/INDICE.md` já criados.
- ⚠ **Cota Pro:** ~6 unidades por janela de 5h (3h/dia de trabalho). Sem registro de consumo até agora (uso.json não existe). Se consumo ultrapassar 60% da cota semanal, reduzir volume diário proporcionalmente.

## Status de bloqueios
| Bloqueio | Depende de | Impacto | Prioridade |
|---|---|---|---|
| T05 (AGUARDA USUÁRIO) | Disponibilidade do desenvolvedor + Firewall do Windows | Atrasa T06, T07 | ALTA |
| T12 (AGUARDA USUÁRIO) | Agendamento com perfumista | Atrasa T13, pode afetar T14, impacta requisitos finais | **CRÍTICA** |
| T14 (AGUARDA USUÁRIO) | Decisão do desenvolvedor (A/B/C) | Atrasa T15, T16, T17, impacta data de publicação | ALTA |
| T18-T19 (AGUARDA USUÁRIO + confirmação) | Aprovação explícita do desenvolvedor | Atrasa publicação | CRÍTICA |

---

**Próxima atualização:** após conclusão de hoje (T01-T04-T08) ou se houver bloqueio não previsto.
