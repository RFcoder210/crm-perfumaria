---
name: encerrar-dia
description: Encerra o dia de trabalho do sistema de agentes gravando o checkpoint de retomada. Use ao final do dia ou quando o medidor de uso indicar nível crítico.
disable-model-invocation: true
---

# Encerramento do dia

1. **Não inicie nenhuma tarefa nova.** Se um executor estiver no meio de uma tarefa, aguarde o relatório dele.
2. Garanta que a tabela de `.plano/ESTADO.md` está atualizada (edite apenas os status que mudaram).
3. Escreva um resumo de 5 a 10 linhas com:
   - tarefas concluídas hoje;
   - tarefa em andamento e o passo exato em que parou (se houver);
   - pendências abertas e seus destinos;
   - decisões tomadas hoje que não estão em nenhum arquivo;
   - o que depende do usuário.
3b. Feche a linha do dia em `.plano/DIARIO.md`: confira o nome da sessão e escreva em uma ou duas frases o que foi feito, com o total de tarefas concluídas. Se o foco do dia mudou e o nome da sessão ficou desatualizado, acerte-o com `set_session_title` (`session_id: "self"`).
4. Acione o agente `contexto-tokens` com esse resumo e o motivo "fim do dia".
5. Responda ao usuário, em no máximo 8 linhas:
   - o que foi concluído hoje e o progresso geral (X de Y tarefas);
   - a primeira ação de amanhã;
   - qualquer coisa que ele precise providenciar antes da próxima sessão;
   - a orientação final: "Pode fechar o Claude Code (/exit). Na próxima sessão, abra o Claude Code nesta pasta e digite /orquestrar."
