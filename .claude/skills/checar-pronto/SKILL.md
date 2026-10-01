---
name: checar-pronto
description: Confere a Definição de Pronto (seção 9 do CLAUDE.md) antes de commitar uma alteração do CRM. Roda os testes, cruza a mudança com o TESTES.md e separa o que foi verificado do que só o desenvolvedor consegue confirmar no celular.
disable-model-invocation: true
---

# Conferência de "pronto" — CRM Perfumaria

Esta skill é uma lista de conferência, como a de um piloto antes da decolagem: cada item é verificado, nunca presumido. Siga os passos **nesta ordem** e responda em português do Brasil.

A regra central: **só afirme "passou" o que você de fato executou ou leu neste momento.** O que depende do celular ou de uma pessoa fica marcado como "não verificado", e não como aprovado.

## Passo 1 — Ver o que mudou
- `git status --short` e `git diff --stat`.
- Se não houver alteração, diga isso e encerre.
- Resuma em uma frase a mudança que está sendo conferida.

## Passo 2 — Testes automatizados
- Rode `npm test` e informe o resultado literal (quantos passaram, quantos falharam).
- Se algum falhar: pare aqui, mostre a linha que falhou e **não** siga para os próximos passos.

## Passo 3 — Cruzar com o TESTES.md
- Leia `TESTES.md` e liste os itens do roteiro que a mudança pode afetar.
- Para cada um, diga se está coberto por `teste.js` (cite o nome do teste) ou se é só manual.
- Se a mudança criou um comportamento novo sem teste e sem item no roteiro, diga isso claramente e sugira usar `/novo-teste`.
- **Não marque `[x]` no TESTES.md.** Os itens manuais só são marcados pelo desenvolvedor depois de testar no aparelho.

## Passo 4 — Critérios do CLAUDE.md, seção 9
Responda cada item com uma destas marcas: **verificado**, **falhou** ou **não verificado (motivo)**.

1. Roteiro de `TESTES.md` passa inteiro → só o que o `npm test` cobre pode ser "verificado"; o restante é "não verificado: precisa do celular".
2. Funciona em tela de celular → leia o CSS e o HTML alterados procurando alvos de toque pequenos, rolagem lateral e textos cortados. O jsdom não vê layout, então o veredito é no máximo "indício", nunca "verificado".
3. Os dados continuam íntegros após recarregar → verificado se houver teste de recarregamento cobrindo o trecho alterado; senão, "não verificado".
4. Texto da interface em português, em frases que o perfumista entenderia sem explicação → leia os textos novos ou alterados e aponte jargão ou frases confusas.
5. Mudança pronta para commit com mensagem descritiva em português → proponha a mensagem (Passo 5).

## Passo 5 — Fechar
Entregue um relatório de no máximo 15 linhas:
- **Resultado dos testes** (uma linha).
- **Tabela dos 5 critérios**, com a marca de cada um.
- **O que precisa do celular** (lista curta, para o desenvolvedor testar).
- **Mensagem de commit sugerida**, em português, no imperativo e específica.

Se tudo que dava para verificar passou, pergunte se o desenvolvedor quer que você faça o commit. **Não commite sem o "sim" dele** e não faça push.

## Limites
- Não edite `index.html`, `teste.js` ou `TESTES.md` durante a conferência. Esta skill só lê e roda testes.
- Se encontrar um problema, descreva-o e proponha a correção; a correção é outra etapa, com plano e confirmação.
