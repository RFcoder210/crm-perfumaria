---
name: novo-teste
description: Cria um teste novo no padrão do projeto, em teste.js (jsdom), e a linha correspondente no roteiro TESTES.md. Use depois de criar ou corrigir um comportamento do CRM. Argumento: o comportamento a testar.
argument-hint: comportamento a testar, em uma frase
disable-model-invocation: true
---

# Novo teste — CRM Perfumaria

Comportamento a testar: **$ARGUMENTS**

Um teste automatizado é como um inspetor de qualidade que repete sozinho, em segundos, a mesma conferência que você faria à mão. Esta skill cria um inspetor novo no mesmo padrão dos que já existem. Responda em português do Brasil.

## Passo 1 — Entender o comportamento
- Se `$ARGUMENTS` estiver vazio, pergunte qual comportamento testar e pare.
- Leia o trecho de `index.html` que implementa o comportamento (use Grep pelos nomes de função, `data-acao` e classes envolvidas).
- Diga em uma frase o que será verificado e **qual deve ser o resultado esperado**. Se o código não fizer o que o pedido descreve, avise antes de escrever o teste.

## Passo 2 — Conferir se já existe teste
- Leia `teste.js` e `TESTES.md`.
- Se um teste ou item do roteiro já cobre o comportamento, diga qual e pare. Não duplique.

## Passo 3 — Plano curto (PARE e aguarde confirmação)
Mostre, antes de editar qualquer arquivo:
- o nome do teste, no estilo dos existentes (frase em português que descreve o comportamento, ex.: `'o CSV preserva acento e apóstrofo'`);
- em que ponto de `teste.js` ele entra;
- a linha que entra no `TESTES.md` e em qual seção.

Só continue depois do "sim" do desenvolvedor.

## Passo 4 — Escrever o teste em teste.js
Siga o padrão que já existe no arquivo:

- Verificação com a função `ok(nome, condicao)`. Uma verificação por comportamento; o nome diz o que se espera, não como.
- Página nova com `new JSDOM(html, { runScripts: 'dangerously', url: 'https://exemplo.local/' })`. Use uma página **nova** para cada cenário, para um teste não contaminar o outro.
- Para simular "dados que já estavam guardados" ou "recarregar a página", crie outra página com `beforeParse(w) { w.localStorage.setItem('crm-perfumes:dados', ...) }`. As chaves do projeto são `crm-perfumes:dados` e `crm-perfumes:backup`.
- Para clicar, use o auxiliar `clicar(doc, seletor)` quando o botão tiver `data-acao`; para os marcadores do funil, `.dot`.
- Datas: se o comportamento depende de "hoje", não dependa do relógio real. Use o auxiliar `paginaEm('AAAA-MM-DD', ...)` de `teste.js`, que abre a página fingindo que hoje é aquele dia (veja como os testes do aviso de backup o usam).
- **Posição:** o novo bloco entra **antes** das duas últimas linhas do arquivo (o `console.log` do resumo e o `process.exit`). Elas precisam continuar por último, senão o resultado final deixa de ser contado.
- Comentário curto em português acima do bloco, no mesmo tom dos existentes. Não crie as páginas `dom2`, `dom3`, `dom4` nem outras variáveis que não use.

## Passo 5 — Provar que o teste serve
Um teste que nunca falha não protege nada. Faça as duas conferências:

1. Rode `npm test`: o teste novo deve aparecer como `ok` e o total deve subir em 1 (ou no número de verificações criadas).
2. Quebre o comportamento de propósito, **de forma temporária**, com uma mudança mínima em cópia ou em edição que você desfaz em seguida, rode `npm test` e confirme que o teste novo vira `FALHA`. Depois restaure o arquivo e rode `npm test` de novo, para confirmar que voltou a passar. Confirme com `git diff` que sobrou só o teste novo.

Se o teste não falhar quando o comportamento é quebrado, ele está testando a coisa errada: corrija antes de seguir.

## Passo 6 — Roteiro manual
- Acrescente em `TESTES.md`, na seção adequada, uma linha no formato `- [ ] ...`, em frase que o perfumista entenderia. Deixe **desmarcada**: só o desenvolvedor marca depois de testar no aparelho.
- Se o comportamento é só visual ou de celular (o jsdom não cobre), a linha do roteiro é o único teste. Diga isso e não force um teste automático inútil.

## Passo 7 — Fechar
Relatório em no máximo 8 linhas: o que foi criado, resultado final de `npm test` (X passaram), confirmação de que o teste falha quando o comportamento é quebrado e a mensagem de commit sugerida. **Não commite sem confirmação** e não faça push.
