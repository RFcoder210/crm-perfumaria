# Retomada — 2026-09-30 18:26
Motivo do checkpoint: fim do dia

## Onde paramos
- Última tarefa concluída: T23 — roteiro de retorno de uma semana preparado
- Tarefa em andamento: nenhuma
- Código e planejamento enviados ao GitHub (T18 concluída em 2026-09-30): origin = https://github.com/RFcoder210/crm-perfumaria. Árvore limpa. Só .plano/estado/ fica fora do Git, por decisão.

## Próxima ação (a primeira coisa a fazer)
1. Usuário abre https://github.com/RFcoder210/crm-perfumaria no navegador e confere os arquivos (fecha a T18); depois ativa o GitHub Pages (T19): Settings > Pages > Deploy from a branch > main / (root)
2. Executar T19 (verificar o Pages no ar) e T21 (retestar no endereço publicado, inclusive o ícone da Tela de Início)
3. Só após T19 iniciarem T22 (guia de uso)
4. Remover ícone de teste do iPhone (aponta para http://192.168.0.79:8000, servidor já encerrado)

## Pendências abertas
- T12: entrevista com o perfumista ("GB"); roteiro em .plano/tarefas/T11-roteiro-entrevista.md
- T13: registrar respostas da entrevista; arquivo: docs/respostas-entrevista.md (revisar antes de enviar)
- T21: retestar no celular no endereço publicado (após T19)
- T22: escrever guia de uso (aguarda T19, depois rever antes de enviar)
- Backup do histórico .git antigo em ../crm-perfumaria-backup-git-2026-09-30 (contém Gmail; nunca enviar)

## Decisões tomadas (não estão em outro arquivo)
- Endereço: opção A (GitHub Pages), URL final https://rfcoder210.github.io/crm-perfumaria/
- Cenário de publicação: 1 (público com tudo)
- Autoria nos commits: reescrita para 261683420+RFcoder210@users.noreply.github.com (e-mail parcial removido do histórico)
- Proteção de dados: opção 1 (usar ícone da Tela de Início) + opção 3 (aviso de exportação)
- Achado iPhone: ícone da Tela de Início tem armazenamento SEPARADO do Safari (abriu vazio, mas sobreviveu a fechar/abrir)

## Estado técnico
- npm test: 53 verificações passando
- Roteiro TESTES.md: 31/31 caixas marcadas em iPhone/Safari; CSV conferido no Excel
- Aviso de backup: implementado (T10); dispara com 7 dias sem exportar ou na virada do mês; chave separada `crm-perfumes:backup`
- Ideia registrada (não implementada): dashboard mensal (protótipo em docs/prototipo-dashboard.html; cópia em Downloads)

## Aguardando o usuário
- T12: agendar entrevista com o perfumista
- Depois de T19: retestar e remover ícone de teste do iPhone

## Ler se necessário
- .plano/ESTADO.md (tabela de 28 tarefas) | .plano/tarefas/T12-usuario-entrevista.md | docs/respostas-entrevista.md
