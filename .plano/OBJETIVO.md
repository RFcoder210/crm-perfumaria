# Objetivo do projeto

> Preencha os campos marcados com **(obrigatório)** antes de executar `/orquestrar`.
> Escreva como se estivesse explicando a um colega que nunca viu o projeto.

## Objetivo final (obrigatório)
Sistema de controle de leads e vendas de perfumes, em arquivo único (HTML, CSS e
JavaScript puros), publicado gratuitamente no GitHub Pages, testado no celular e
entregue ao usuário final (perfumista autônomo), com uma semana de uso real e
ajustes de campos conforme o retorno dele. A fase de testes com Playwright vem
depois dessa entrega.

## Critérios de conclusão (obrigatório)
- O roteiro do TESTES.md passa inteiro em navegador real e no celular, e `npm test` passa.
- Os dados sobrevivem a recarregar a página e a fechar e reabrir o navegador, no celular.
- O sistema está publicado no GitHub Pages, em endereço definitivo decidido antes da entrega.
- O CSV exportado abre no Excel ou no Google Sheets com a acentuação correta.
- O sistema foi entregue ao usuário final, com a rotina semanal de exportar o CSV explicada.
- Uma semana de uso real foi acompanhada e o retorno registrado no CLAUDE.md
  (itens da seção 7.3 movidos para CONFIRMADO ou reabertos).

## Prazo final (obrigatório)
- Prazo final: sem prazo fixo.
- Entregas intermediárias: publicação no GitHub Pages; teste no celular; entrega ao usuário final (sem datas definidas).

## Disponibilidade (obrigatório)
- Dias da semana em que vou trabalhar no projeto: segunda a sexta, com margem para dar uma olhada no projeto nos fins de semana (definido em 2026-09-29). 3 horas nos dias de trabalho.
- Commits: os agentes podem commitar (mensagem descritiva em português). Envio ao GitHub (push) continua exigindo a frase explícita "CONFIRMO enviar ao GitHub" (tarefa T18), conforme a restrição de não publicar sem confirmação.
- Horas por dia, em média: 3
- Plano do Claude: Pro

## Situação atual
Aplicação funcional em index.html (leads com funil de 6 etapas e vendas), dados em
localStorage, busca sem acento, texto digitado preservado na edição, área de toque
ampliada nos marcadores. 26 testes automáticos com jsdom passando; roteiro manual
rodado no navegador do computador. Git iniciado localmente; nada publicado.
Pendentes: teste no celular, criação do repositório no GitHub, publicação, entrega.
A entrevista com o usuário final estava marcada e não aconteceu; os requisitos
seguem como SUPOSIÇÃO (CLAUDE.md, seções 6.3 e 7.3).

## Restrições
- Somente ferramentas gratuitas; tudo feito pelo desenvolvedor, sozinho, em casa.
- Arquivo único, JavaScript puro, sem framework e sem etapa de build (decisão fechada).
- Não publicar nada na internet sem confirmação explícita do desenvolvedor.
- Uma alteração por vez, com commit pequeno e mensagem em português; plano curto
  antes de editar arquivos. Mudanças no index.html seguem o comando /funcionalidade.
- Ideias fora da ordem (lembrete de recompra, lucro, gráficos, estoque) ficam
  registradas, não implementadas. Sem otimização de desempenho antes de medir.
- Passos que dependem do usuário (entrevista, login no GitHub, teste no aparelho,
  decisão do endereço) devem constar como AGUARDA USUÁRIO, nunca ser assumidos.

## Recursos disponíveis
Git configurado; Node 24 e npm com jsdom; Python 3.14 (servidor local para teste no
celular); navegador embutido para testes. Conta e repositório no GitHub: ainda não
confirmados. Nenhuma senha ou chave neste arquivo.

## Meu nível técnico
Estudante de IA, iniciante em programação, estudando Python em paralelo. Explicar
cada conceito novo com analogia do mundo real (CLAUDE.md, seção 2).
