# T03 — Teste automatizado do conteúdo do CSV

**Fase:** 1 — Base local
**Porte:** P
**Depende de:** T02
**Executor:** executor-tarefa

## Contexto mínimo
Um critério de conclusão do projeto é que o CSV exportado abra no Excel/Google Sheets com a acentuação correta. O `teste.js` (jsdom) hoje não testa a exportação. O jsdom não abre o Excel, mas dá para capturar o texto que a função `exportar()` (em `index.html`, por volta da linha 785) entrega ao navegador e conferir: marca de ordem de bytes UTF-8 (BOM, `﻿`, que faz o Excel reconhecer acentos), separador `;`, seções `LEADS` e `VENDAS`, acentos e aspas preservados. A abertura real no Excel continua sendo conferida por pessoa (T05).

## Arquivos para ler
- `index.html`, função `exportar()` (linhas 785 a 803)
- `teste.js` (estrutura geral; helpers `ok` e `clicar`)

## O que fazer
1. Em `teste.js`, antes do `console.log` final, acrescente uma "Sessão 6: exportação". Usando a primeira página (`dom`, que já tem "Márcia D'Ávila", "Ana Telefone", "Teste Limpeza" e 1 venda):
   - substitua `dom.window.Blob` por uma classe simples que guarde o primeiro argumento (lista de partes) em uma variável;
   - defina `dom.window.URL.createObjectURL = () => 'blob:teste'` e `dom.window.URL.revokeObjectURL = () => {}`;
   - substitua `dom.window.HTMLAnchorElement.prototype.click` por função vazia (o jsdom não baixa arquivos);
   - dispare `clicar(doc, '[data-acao="csv"]')`. Atenção: o botão pode estar na aba de leads; se estiver na de vendas, o seletor continua valendo por ser global. Confirme que o botão existe antes.
2. Acrescente verificações `ok(...)`: texto começa com `﻿`; contém a linha `LEADS` e a linha `VENDAS`; contém `Márcia D'Ávila`; usa `;` como separador; a linha de cabeçalho de leads contém "Observação"; o número de linhas de dados da seção LEADS é 3.
3. Rode `npm test`.

## Arquivos a criar ou alterar
- `teste.js`

## Critério de pronto (verificável)
- [ ] `npm test` passa e mostra pelo menos 5 novas linhas `ok` sobre exportação.
- [ ] Como prova de que o teste realmente testa: remova temporariamente `'﻿' +` do `index.html`, rode `npm test` e confirme que a verificação do BOM dá FALHA; depois restaure o `index.html` (`git checkout -- index.html`) e confirme `git diff --stat index.html` vazio.

## Cuidados
- O `index.html` não pode ficar alterado ao final.
- Não usar bibliotecas novas. Não commitar: proponha a mensagem (sugestão: "Adiciona teste automatizado do conteúdo do CSV exportado").

## Resultado
Concluída. Acrescentada a "Sessão 6: exportação" em `teste.js` (antes do `console.log` final): Blob substituído por classe que captura as partes, `URL.createObjectURL/revokeObjectURL` e `HTMLAnchorElement.prototype.click` neutralizados, clique em `[data-acao="csv"]`. Como o texto começa com o BOM, as linhas são separadas após retirar o BOM para localizar `LEADS`/`VENDAS`.

Verificações novas (8 linhas `ok`): botão existe; BOM no início; seção LEADS; seção VENDAS; acento e apóstrofo preservados; separador `;`; cabeçalho com "Observação"; 3 linhas de dados em LEADS.

Evidência: `npm test` terminou com "Todos os testes passaram." Prova negativa: removendo `'﻿' +` do `index.html`, o teste mostrou "FALHA | o CSV começa com a marca UTF-8 (BOM) para o Excel" (1 teste falhou). Depois `git checkout -- index.html`: `git diff --stat index.html` vazio e `npm test` passando.

Arquivo alterado: `teste.js`. Não commitado. Mensagem sugerida: "Adiciona teste automatizado do conteúdo do CSV exportado".
