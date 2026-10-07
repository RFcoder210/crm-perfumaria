# Diário das sessões

Uma linha por dia de trabalho. O número do dia é o que aparece no nome da sessão no Claude Code. Mantido pelo `/orquestrar` (abre a linha do dia) e pelo `/encerrar-dia` (fecha com o resumo).

Formato do nome da sessão: `Dia N · DD/MM · foco do dia` (até uns 50 caracteres).

| Dia | Data | Nome da sessão | O que foi feito |
|---|---|---|---|
| 1 | 2026-09-29 | Dia 1 · 29/09 · Plano e preparação | Análise do projeto, PLANO.md, 28 tarefas e preparação do ambiente. |
| 2 | 2026-09-30 | Dia 2 · 30/09 · GitHub no ar e guia | Testes no iPhone (Safari e ícone) e no Excel, aviso de backup, repositório público no ar com o GitHub Pages, guia do perfumista e nomeação das sessões por dia. 21 de 28 tarefas concluídas. |
| 3 | 2026-10-01 | Dia 3 · 01/10 · Entrevista (T12) | Dia sem tarefa de agente: tudo aguarda a entrevista (T12). Cronograma atualizado, CSV conferido no Numbers e ícone de teste removido do iPhone (pelo usuário), commits enviados ao GitHub. À noite, fora do ciclo de tarefas: 2 hooks (teste ao fim da resposta e proteção de `.plano/estado/`), 2 skills (`/checar-pronto`, `/novo-teste`) e 2 revisores só de leitura (`revisor-celular`, `revisor-dados`); a primeira revisão gerou 12 pendências em `PENDENCIAS.md`; corrigido o aviso de erro que sumia com dados ilegíveis (cadastro recusado, +7 testes, total 60); criada a T29. 21 de 29 tarefas concluídas (a T29 é nova). Todos os commits do dia foram enviados ao GitHub, e o Pages já publica a correção. |
| 4 | 2026-10-05 | Dia 4 · 05/10 · Dados ilegíveis (T29) | Roteiro curto da entrevista (`docs/entrevista-curta.md`, 9 perguntas com exemplos); entrevista marcada para hoje. T29 item A concluído (JSON de formato errado vira dados ilegíveis, +13 verificações, 73 testes); item B aguarda decisão do desenvolvedor e a T29 segue EM_ANDAMENTO. Commits locais, sem push. |
| 5 | 2026-10-06 | Dia 5 · 06/10 · Dados ilegíveis e site | Dia curto. T29 concluída (item B, opção ii: leitura que falha bloqueia o cadastro; commits `09e006e` e `6b09f36`, +5 verificações, total 78). Revisão de dados registrou 4 achados novos em `PENDENCIAS.md`. Respostas do Giordano sobre o site registradas em `docs/entrevista-site.md`: o domínio é `gbparfum.com` (ele "acha" que pagou), o Nicolas criou o site antigo, e a senha passada por ele foi testada e deu inválida. Entrevista principal (T12) segue sem acontecer. 22 de 29 tarefas concluídas. Sem push. |
