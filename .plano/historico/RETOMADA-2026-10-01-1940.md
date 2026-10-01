# Retomada — 2026-10-01 19:40
Motivo do checkpoint: fim do dia (Dia 3, segunda parte: automações do projeto, revisão de dados e de celular, correção do aviso que some, tarefa T29 criada)

## Onde paramos
- Última tarefa concluída do plano: T23 (21 de 29 tarefas concluídas; a T29 é nova e está PENDENTE)
- Tarefa em andamento: nenhuma
- Árvore do Git limpa; tudo commitado em `main`. **Nada do trabalho da tarde foi enviado ao GitHub** (último push: `46f3975`). O GitHub Pages ainda publica a versão SEM a correção do aviso.

## Próxima ação (Dia 4, nesta ordem)
1. **Validar os hooks e agentes novos** (só entram em sessão nova): ao fim da primeira resposta com `index.html` ou `teste.js` alterado, deve aparecer "npm test: todos os testes passaram". Conferir também que `revisor-celular`, `revisor-dados` e as skills `/checar-pronto` e `/novo-teste` aparecem como disponíveis. Se algo faltar, ver `.claude/settings.json` e `.claude/hooks/`.
2. Perguntar: entrevista (T12) foi marcada ou já realizada? Se sim, T13; se não, ajudar a agendar.
3. **T29** (`.plano/tarefas/T29-leitura-invalida-do-armazenamento.md`), recomendada antes da T24. Começar pelo item A. O item B exige decisão do desenvolvedor entre três saídas (segunda trava só de gravação; tratar como bloqueado e mudar a mensagem; aceitar o risco). Usar `/funcionalidade`, um commit por correção, `/novo-teste` para cada teste e `/checar-pronto` no fim.
4. Perguntar se o desenvolvedor quer enviar ao GitHub os commits do Dia 3 (a correção do aviso só chega ao celular do perfumista depois do push e da publicação).

## Pendências abertas
- T12 (U): entrevista. T13 bloqueada por T12.
- T24 (U): entregar; T25 a T28 bloqueadas por T24.
- **T29**: item A (JSON de formato errado) e item B (leitura que falha, com armadilha de interação com a trava de cadastro).
- `.plano/PENDENCIAS.md`: 11 entradas abertas da revisão de 01/10 (1 resolvida). Resumo: dados (conversão em venda, exportação com dados bloqueados, "Apagar tudo"), celular (botões `.mini` pequenos, tabela de vendas com coluna Ações fora da tela, rótulos do funil de 8,5 a 9,5 px, outros alvos abaixo de 44 px, textos de 10 a 11 px) e lacunas de cobertura do `teste.js`. São leituras de código: o que for "indício" só se confirma no celular.
- Verificações no iPhone (por volta de 07/10): passo 4 do guia (compartilhamento) e 3 itens do aviso de backup.

## Decisões tomadas (Dia 3)
- Processo: PR não é usado; commits direto na `main`; push só quando o usuário pedir.
- **Dados ilegíveis (opção A, commit `1bfdc4d`):** com `bloqueado`, o sistema RECUSA cadastrar lead e venda; o aviso fica na tela e o texto digitado fica no formulário. Escolhida porque cadastrar "só na tela" perde trabalho em silêncio.
- **Hook de testes no fim da resposta (evento Stop), não a cada edição.** Roda `npm test` só se `index.html` ou `teste.js` mudaram (hash em `.plano/estado/ultimo-teste.txt`). Leva cerca de 2 s dentro do hook; se a falha persistir, não insiste (`stop_hook_active`).
- Playwright MCP (item 7 das automações) **adiado**; o navegador embutido do app tem preset de celular (375×812) e serve para conferências simples. O Playwright é o item 5 da ordem de trabalho do CLAUDE.md.
- `/checar-pronto` e `/novo-teste` nunca marcam itens manuais do `TESTES.md` nem commitam sem confirmação.
- A numeração dos dias vem do `DIARIO.md`: 01/10 foi o Dia 3, amanhã é o Dia 4. (Mensagens de commit antigas que dizem "Dia 5" ou "D4" estão erradas e não serão reescritas.)

## Aguardando o usuário
- T12: marcar e realizar a entrevista.
- Escolha do item B da T29.
- Decisão de enviar os commits ao GitHub.
- Verificações no iPhone (07/10).

## Estado técnico (imutável)
- `npm test`: 60 testes `ok`, 0 falhas (eram 53 no início do dia; +7 do cadastro com dados ilegíveis).
- TESTES.md: 31/31 no iPhone (rodado antes da correção do aviso; o jsdom cobre a correção, o aparelho não).
- Aviso de backup: implementado (chave `crm-perfumes:backup`).
- GitHub Pages: ativo em RFcoder210/crm-perfumaria (versão anterior à correção).
- Automações novas em `.claude/`: hooks `testar-ao-parar.ps1` (Stop) e `proteger-estado.ps1` (PreToolUse em Edit e Write, bloqueia `.plano/estado/`); skills `checar-pronto` e `novo-teste`; agentes `revisor-celular` e `revisor-dados` (só leitura). Commits `e8cf806` a `150e3a8`.

## Ler se necessário (evite reler o que não precisa)
- `.plano/tarefas/T29-leitura-invalida-do-armazenamento.md`: a tarefa do dia, com tudo que ela exige.
- `.plano/PENDENCIAS.md`: achados com arquivo e linha. O `index.html` tem cerca de 940 linhas: ler só os trechos citados (`carregar()` ~447, `salvar()` ~466, `acao()` ~780) em vez do arquivo inteiro.
- `.plano/ESTADO.md` (tabela de 29 tarefas) e `.plano/CRONOGRAMA.md` (do Dia 3; refazer no início do Dia 4).
- `teste.js`: bloco dos dados ilegíveis (~59-90) e `paginaEm()` (~132), que controla a data.

## Consumo
- Medidor não ativado nesta sessão
