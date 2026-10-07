# Cronograma — 2026-10-06 (terça-feira)

Prazo final: sem prazo fixo | Dias úteis restantes: n/a | Situação: NO PRAZO
Progresso: 21 de 29 tarefas concluídas (72,4%)

## Hoje (em ordem)
| # | Tarefa | Agente | Porte | Depende de | Observação |
|---|---|---|---|---|---|
| 1 | **[DECISÃO]** T29 item B: escolher opção (i, ii ou iii) — falha só na leitura | Desenvolvedor | — | nenhuma | Pré-requisito para qualquer agente prosseguir. Ver `tarefas/T29-leitura-invalida-do-armazenamento.md`, item B (3 opções). |
| 2 | **[CONFIRMAÇÃO]** Status de T12 (entrevista) | Desenvolvedor | — | nenhuma | Foi realizada em 05/10? Rascunho em `docs/entrevista-site.md` é para hoje ou é esboço? Próxima data se não feita? |
| 3 | Comitar `docs/entrevista-site.md` (rascunho novo) | Agente + git | P | decisão de T12 | Se a entrevista for em breve: revisar e manter. Se for adiada: comitar como está. |
| 4 | Preparação pré-iPhone (verificações 07/10) | Leitura + documentação | P | nenhuma | Revisar passo 4 da T22 (compartilhamento) e aviso de backup; documentar checklist para amanhã. |

## Se sobrar cota hoje
- Releitura do `revisor-dados` pós-T29 (só se item A estiver completo e item B não bloquear).
- Ajustes menores em `PENDENCIAS.md` conforme o status de T29.

## Lembretes antecipados

### Crítico — T12 (entrevista)
- **Status:** marcada para 05/10, não realizada conforme DIARIO.md (Dia 4 EM_ANDAMENTO).
- **Hoje (06/10):** confirmar se foi feita; se não, agendar o mais breve possível (segunda tentativa de agendamento).
- **Impacto:** desbloqueia T13 → T24 (entregar) → T25 (semana de uso) → T26/T27/T28 (ajustes e fechamento).
- **Risco:** recomendação de T29 **antes** de T24; sem T12 realizado, T24 segue com requisitos como SUPOSIÇÃO (CLAUDE.md 7.1).

### Crítico — T29 item B
- **Hoje:** pedir decisão ao desenvolvedor entre 3 opções (i: segunda trava; ii: marcar como bloqueado + nova mensagem; iii: aceitar risco).
- **Recomendação:** resolver hoje para que agente continue amanhã ou próxima sessão.
- **Prerequisito:** antes de qualquer agente aplicar a correção (testes novos, commit).

### Previsto para 07/10 (quarta-feira)
Verificações no iPhone:
- Passo 4 do guia (compartilhamento) — T22
- 3 itens do aviso de backup (backup está ligado? Mensagem aparece? Desaparece em 7 dias?)

Preparação começa hoje (item 4 acima).

## Próximos 3 dias úteis (previsão)

| Data | Foco | Tarefas | Bloqueios |
|---|---|---|---|
| **07/10 (qua)** | Verificações no iPhone | Passo 4 do guia (compartilhamento) + aviso de backup (3 itens). | T12, T29B desembaraçadas. |
| **08/10 (qui)** | T29 item B (se decidido) OU T12/T13 (se entrevista hoje) | T29B: aplicar correção (P) + testes e commit. OU T13: registrar respostas de entrevista (P). | Decisão de T29B hoje ou confirmação de T12. |
| **09/10 (sex)** | T13 (se não feito) ou T14 reconfirmar | T13 (P), depois T14 (reconfirmar endereço). Ou, se T12 marcado para depois: preparar agenda. | Resultado de 08/10. |

**Carga de agente próxima (acumulado):**
- T29 item B (se i ou ii): P (1) + testes + commit
- T13 (após T12): P (1)
- T24–T28: M (3) + P (1) + P (1) = 5 unidades mais responsabilidade do usuário (T24, T25)
- **Total:** ~8–10 unidades de agente + responsabilidade do usuário

## Estado técnico atual
- npm test: 73 passando (após T29 item A, commit `85db64e`)
- TESTES.md: 31/31 em iPhone (confirmado 30/09)
- Repositório: publicado no GitHub Pages em RFcoder210/crm-perfumaria
- Guia de uso: docs/guia-do-usuario.md (completo)
- Proteção: ícone Tela de Início + aviso de backup (7 dias)
- Ambiente: PRONTO (todas as ferramentas em `.plano/estado/AMBIENTE.md`)
- Hooks e agentes: ativados em 01/10 (`testar-ao-parar.ps1`, `proteger-estado.ps1`, `/checar-pronto`, `/novo-teste`, `revisor-celular`, `revisor-dados`)

## Riscos abertos
- ⚠ **T12 (entrevista):** segunda tentativa. Sem ela, T24 segue com requisitos como SUPOSIÇÃO (CLAUDE.md 7.1, risco).
- ⚠ **T29 item B:** bloqueia conclusão de T29. Pedir decisão hoje.
- ⚠ **11 pendências abertas** em `.plano/PENDENCIAS.md` (dados: conversão em venda, exportação bloqueada, "Apagar tudo"; celular: botões, tabela, fontes; lacunas de teste). Nenhuma crítica antes de T24, mas indicadas para pós-entrega.
- ⚠ **Sem prazo fixo:** estimativa total: 2–3 dias de T29 + T12/T13 + 6 dias de T26/T27/T28 + 7 dias de T25 (uso real) + ajustes pós-retorno. Sem bloqueio externo conhecido.

---

**Próxima atualização:** fim de dia 06/10 com `/encerrar-dia`.
