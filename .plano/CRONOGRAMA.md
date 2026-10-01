# Cronograma — 2026-10-01 (quinta-feira)

Prazo final: sem prazo fixo | Tarefas concluídas: 21 de 28 (75%) | Situação: BLOQUEADO (aguardando usuário)

## Hoje — tarefas liberadas para agentes
Nenhuma. O projeto está em espera da **entrevista com o perfumista (T12)**, que é bloqueante para prosseguir.

| # | Tarefa | Agente | Porte | Depende de | Status |
|---|---|---|---|---|---|
| — | T12 — Realizar a entrevista com o perfumista | usuário | M | T11 (pronto) | **AGUARDA AGENDAMENTO COM O USUÁRIO** |

## Se sobrar cota hoje
Não há tarefas de agente prontas para executar. A prioridade é coordenar com o usuário para agendar T12 (entrevista).

## Lembretes antecipados (próximos 7 dias)

### Crítico — T12 (entrevista)
- **Status:** Pendente de agendamento com o perfumista. Histórico: agendada e não realizada uma vez.
- **Impacto:** Desbloqueia T13 (registrar respostas) e influencia T26/T27/T28 (ajustes de campos). Sem a entrevista, o sistema é entregue com requisitos em status SUPOSIÇÃO.
- **Ação:** Contactar o perfumista assim que possível para definir data e hora.

### Previsto para 07/10 (6 dias)
Conforme RETOMADA.md, há verificações agendadas para o iPhone:
- Passo 4 do guia (compartilhamento)
- 3 itens do aviso de backup (docs/TESTES.md)
- Já feitos em 01/10: acentuação do CSV no Numbers (OK) e remoção do ícone de teste antigo do iPhone

Estas ações não dependem de agente; são validações em campo.

## Próxima sequência (após T12)

Se a entrevista ocorrer:
| # | Tarefa | Porte | Depende de | Observação |
|---|---|---|---|---|
| 1 | **T13** — Registrar respostas e propor CLAUDE.md | P | T12 | Agente (executor-documento) |
| 2 | **T24** — Entregar ao perfumista com guia | M | T21, T22, T23 (concluídas) | Usuário |
| 3 | **T25** — Acompanhar semana de uso (7 dias corridos) | M | T24 | Usuário |
| 4 | **T26** — Consolidar retorno e listar ajustes | P | T25 | Agente (analisador) |
| 5 | **T27** — Aplicar ajustes de campos (condicional) | M | T26 | Agente (executor-funcionalidade) |
| 6 | **T28** — Fechamento e proposta final para CLAUDE.md | P | T26, T27 | Agente (executor-documento) |

**Carga estimada pós-T12:** 6 unidades de agente (T13, T26, T27, T28) + responsabilidade do usuário (T24, T25)

## Estado técnico consolidado
- npm test: 53 passando
- TESTES.md: 31/31 em iPhone
- Repositório: publicado no GitHub Pages (endereço opção A)
- Guia de uso: docs/guia-do-usuario.md (completo)
- Proteção: ícone Tela de Início + aviso de backup (7 dias)
- Ambiente: PRONTO (todas as ferramentas confirmadas em `.plano/estado/AMBIENTE.md`)

## Alertas
- ⚠ **T12 é crítica:** segunda tentativa de agendamento. Se não ocorrer, T24 segue com requisitos como SUPOSIÇÃO (risco registrado em PLANO.md, seção 5; usuário será avisado em T24).
- ⚠ **Sem prazo fixo:** projeto segue em fases. Estimativa: 6 dias de agente (pós-T12) + 7 dias de uso real (T25) + esperas da entrevista + ajustes pós-retorno.
- ⚠ **Cota Pro:** ~6 unidades por janela de 5h. Nenhum consumo registrado até agora. Se passar 60% da cota semanal, reduzir volume diário.

---

**Próxima atualização:** após T12 ocorrer ou se houver mudança de disponibilidade do usuário.
