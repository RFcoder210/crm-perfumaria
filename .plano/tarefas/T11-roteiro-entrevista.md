# T11 — Preparar o roteiro da entrevista com o usuário final

**Fase:** 4 — Requisitos e endereço
**Porte:** P
**Depende de:** nenhuma
**Executor:** executor-tarefa

## Contexto mínimo
A entrevista com o perfumista estava marcada e não aconteceu; todos os requisitos seguem como SUPOSIÇÃO (`CLAUDE.md`, seções 6.3 e 7.3). O desenvolvedor é iniciante e o entrevistado não é da área de tecnologia: o roteiro deve usar perguntas simples, de mundo real, sem termos técnicos. A entrevista pode ser presencial ou por mensagem de voz/texto.

## Arquivos para ler
- `CLAUDE.md` (seções 1, 6.3, 7.1, 7.3)

## O que fazer
1. Crie `docs/roteiro-entrevista.md` com:
   - "Antes de começar": 3 linhas sobre o objetivo e o que o desenvolvedor vai mostrar (o sistema aberto no celular).
   - Uma tabela "Pergunta | Em palavras simples para o perfumista | O que a resposta decide no sistema | Suposição atual".
   - As perguntas da seção 7.3 (1 a 6) reescritas em linguagem comum, mais: qual celular e navegador ele usa (iPhone/Android) e se costuma limpar o navegador ou trocar de aparelho; quantos clientes/leads por mês; se usa WhatsApp para contato; se o site dele vende online (e em que plataforma, quem administra); se aceita exportar uma planilha toda semana.
   - Pergunta 6 (site): incluir as três opções de endereço do `CLAUDE.md` (manter GitHub Pages; subdomínio do site dele; pasta do site, não recomendada) e o que o desenvolvedor precisa saber para cada uma.
   - Uma seção "Como registrar": um bloco em branco para a resposta de cada pergunta, para preencher durante a conversa.
2. Marque as perguntas 1 e 6 (e a do aparelho) como "prioridade: decide arquitetura e endereço".

## Arquivos a criar ou alterar
- `docs/roteiro-entrevista.md`

## Critério de pronto (verificável)
- [ ] O arquivo existe, tem uma linha de tabela para cada uma das 6 perguntas de 7.3 mais as perguntas adicionais, e a coluna "O que a resposta decide" preenchida em todas.
- [ ] `grep -ci "iphone" docs/roteiro-entrevista.md` maior que 0.
- [ ] Nenhuma linha da coluna "em palavras simples" usa os termos localStorage, navegador (como termo técnico), backend, CSV sem explicação (use "planilha").

## Cuidados
- Não presumir respostas: apenas perguntar. Não editar `CLAUDE.md`. Não commitar; proponha a mensagem.

## Resultado
Criado `docs/roteiro-entrevista.md` com: "Antes de começar"; tabela de 14 linhas (perguntas 1 a 6 de 7.3, com 5 dividida em 5a/5b/5c, mais 6a site vende online, 7 celular/programa, 8 limpeza/troca de aparelho, 9 volume, 10 WhatsApp, 11 planilha semanal), todas com "O que a resposta decide" e "Suposição atual"; seção com as três opções de endereço e o que o desenvolvedor precisa saber; seção "Como registrar" com bloco em branco por pergunta. Prioridade marcada nas perguntas 1, 6 e 7 (aparelho).

Verificação: `grep -ci iphone` = 2 (maior que 0); todas as 14 linhas têm 7 colunas (coluna 4 preenchida); grep por localStorage/navegador/backend/csv na coluna "em palavras simples" = nenhum.

Mensagem de commit proposta: "Adiciona roteiro da entrevista com o perfumista"
