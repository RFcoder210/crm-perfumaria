# Cronograma — 2026-10-05 (segunda-feira)

Prazo final: sem prazo fixo | Dias úteis restantes: n/a | Situação: PRONTO PARA CONTINUAR
Progresso: 21 de 29 tarefas concluídas (72,4%)

## Hoje (em ordem)
| # | Tarefa | Agente | Porte | Depende de | Observação |
|---|---|---|---|---|---|
| 1 | **T29** — Tratar leitura inválida do armazenamento (JSON formato errado e falha só na leitura) | executor-funcionalidade | P | nenhuma | Recomendada antes de T24 (entrega). Item A: tratável. Item B: decisão do desenvolvedor. Ver `tarefas/T29-leitura-invalida-do-armazenamento.md` |

## Se sobrar cota hoje
- Agendamento de T12 (entrevista com o perfumista): contactar o usuário para confirmar data e hora.
- Revisão de docs/roteiro-entrevista.md e preparação de T13 (caso a entrevista seja confirmada para breve).

## Lembretes antecipados

### Crítico — T12 (entrevista)
- **Status:** entrevista marcada para hoje (05/10), informado pelo desenvolvedor. Roteiro curto em `docs/entrevista-curta.md`.
- **Impacto:** Desbloqueia T13 (registrar respostas), T26/T27/T28 (ajustes de campos) e libera T24 (entregar).
- **Recomendação:** assim que houver respostas, registrar no Resultado da T12 e liberar a T13.

### Previsto para 07/10 (quarta-feira, 2 dias úteis)
Conforme RETOMADA.md, há verificações pendentes no iPhone:
- Passo 4 do guia (compartilhamento)
- 3 itens do aviso de backup (docs/TESTES.md)

Estas ações não dependem de agente; são validações em campo.

## Próxima sequência (após T12 ou T29)

**Após T12 (entrevista):**
| # | Tarefa | Porte | Agente | Observação |
|---|---|---|---|---|
| 1 | **T13** — Registrar respostas e propor CLAUDE.md | P | executor-documento | Desbloqueia T26/T27/T28 |
| 2 | **T24** — Entregar ao perfumista com guia (T21, T22, T23 já concluídas) | M | usuário | Bloqueia T25 |
| 3 | **T25** — Acompanhar semana de uso (7 dias corridos) | M | usuário | Bloqueia T26 |
| 4 | **T26** — Consolidar retorno e listar ajustes | P | analisador | Bloqueia T27/T28 |
| 5 | **T27** — Aplicar ajustes de campos (condicional) | M | executor-funcionalidade | Bloqueia T28 |
| 6 | **T28** — Fechamento e proposta final para CLAUDE.md | P | executor-documento | Fim da fase |

**Carga estimada pós-T12:** 6 unidades de agente (T13: P=1, T26: P=1, T27: M=3, T28: P=1) + responsabilidade do usuário (T24, T25)

## Estado técnico consolidado
- npm test: 60 passando (após correção do aviso com dados ilegíveis, commit `1bfdc4d`)
- TESTES.md: 31/31 em iPhone
- Repositório: publicado no GitHub Pages (endereço opção A, em RFcoder210/crm-perfumaria)
- Guia de uso: docs/guia-do-usuario.md (completo)
- Proteção: ícone Tela de Início + aviso de backup (7 dias)
- Ambiente: PRONTO (todas as ferramentas em `.plano/estado/AMBIENTE.md`)
- Hooks e agentes novos: ativados em 2026-10-01 (validação de entrada em /orquestrar)

## Alertas
- ⚠ **T29 recomendada antes da T24:** trata dois caminhos onde o sistema grava por cima de dados ilegíveis. Item A é executável; item B exige decisão (opção i, ii ou iii).
- ⚠ **T12 é crítica:** segunda tentativa de agendamento. Se não ocorrer, T24 segue com requisitos como SUPOSIÇÃO (risco registrado em PLANO.md, seção 5).
- ⚠ **Sem prazo fixo:** projeto segue em fases. Estimativa: 1 dia de T29 + entrevista (data indefinida) + 6 dias de agente (T13, T26, T27, T28) + 7 dias de uso real (T25) + ajustes pós-retorno.
- ⚠ **Cota Pro:** ~6 unidades por janela de 5h. T29 é 1 unidade. Nenhum consumo registrado.

---

**Próxima atualização:** após T29 concluída e antes do fim do dia, ou quando houver mudança em T12/T24.
