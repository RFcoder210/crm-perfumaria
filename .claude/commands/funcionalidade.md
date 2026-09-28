---
description: Desenvolve uma funcionalidade ou correção do CRM em etapas guiadas (entender, explorar, planejar, implementar, verificar, commitar)
argument-hint: descrição da funcionalidade ou correção
---

# Desenvolvimento guiado de funcionalidade — CRM Perfumaria

Pedido do desenvolvedor: **$ARGUMENTS**

Siga as etapas abaixo, **nesta ordem**, sem pular nenhuma. Ao fim de cada etapa marcada com PARE, aguarde a resposta do desenvolvedor antes de continuar.

## Etapa 0 — Contexto
1. Leia o `CLAUDE.md` por completo. Ele define o modelo de dados, as regras de trabalho, os riscos em aberto (seção 7) e a definição de pronto (seção 9).
2. Leia o `TESTES.md`.
3. Rode `git status`. Se houver alterações não commitadas, avise e pergunte o que fazer antes de seguir.

## Etapa 1 — Entender o pedido
1. Reescreva o pedido em uma ou duas frases, do ponto de vista do usuário final (o perfumista, usando pelo celular).
2. Verifique se o pedido depende de alguma **SUPOSIÇÃO** da seção 7.3 do `CLAUDE.md`. Se depender, diga qual e qual o risco de implementar antes da confirmação com o usuário final.
3. Verifique se o pedido está fora da ordem de trabalho da seção 8. Se estiver, diga isso claramente.
4. Faça no máximo 3 perguntas objetivas, apenas as que mudam a implementação.

**PARE.** Aguarde as respostas.

## Etapa 2 — Explorar o código
1. Localize no `index.html` as partes que serão afetadas (funções, elementos, trechos de CSS), citando os nomes.
2. Explique em linguagem simples como essas partes funcionam hoje. Para cada conceito novo de programação que aparecer, dê uma explicação de uma ou duas frases com analogia do mundo real.
3. Aponte se a mudança afeta os dados salvos (chave `crm-perfumes:dados`). Se afetar, o plano precisa garantir que os dados já existentes continuem sendo lidos corretamente.

## Etapa 3 — Planejar
Apresente um plano curto com:
- o que muda, em quais trechos;
- o que **não** muda;
- quais itens do `TESTES.md` precisam ser acrescentados ou alterados;
- se o `teste.js` precisa de um novo teste automatizado;
- a mensagem de commit proposta, em português.

Se o plano tiver mais de uma alteração independente, divida em partes e proponha fazer uma por vez, cada uma com seu commit.

**PARE.** Aguarde a aprovação do plano.

## Etapa 4 — Implementar
1. Implemente apenas a parte aprovada. Nada além do plano.
2. Textos da interface em português, em frases que o usuário final entenderia sem explicação.
3. Mantenha tudo em HTML, CSS e JavaScript puro no `index.html`, sem framework e sem etapa de build.

## Etapa 5 — Verificar (definição de pronto)
1. Atualize o `TESTES.md` e o `teste.js`, se previsto no plano.
2. Rode `npm test` e mostre o resultado. Se falhar, corrija antes de seguir.
3. Liste para o desenvolvedor os itens do `TESTES.md` que ele precisa conferir manualmente no navegador e no celular.
4. Confira item por item a seção 9 do `CLAUDE.md` e informe o que está cumprido e o que depende do teste manual.

## Etapa 6 — Commit e registro
1. Mostre o resumo das alterações (`git diff --stat`).
2. **PARE.** Peça confirmação para commitar.
3. Faça o commit com a mensagem aprovada.
4. Se a mudança alterar o estado do projeto, proponha a atualização correspondente no `CLAUDE.md` (seções 3, 7 ou 8) e aguarde confirmação.
5. Se algum conceito importante apareceu, avise: "isso vale para o Caderno de Conceitos", com o nome do conceito e uma definição curta.
