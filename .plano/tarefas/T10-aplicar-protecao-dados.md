# T10 — Aplicar a proteção de dados aprovada (condicional)

**Fase:** 3 — Proteção dos dados
**Porte:** P
**Depende de:** T09
**Executor:** executor-tarefa

## Contexto mínimo
Tarefa condicional. Implementa somente o que o desenvolvedor aprovou na T09. Se a decisão foi "nenhuma alteração de código" ou "só documentação", marque CONCLUIDA com a nota correspondente (a documentação entra no guia de uso, T22).

## Arquivos para ler
- `.plano/tarefas/T09-usuario-decidir-protecao.md` (Resultado)
- `docs/pesquisa-armazenamento.md`
- `.claude/commands/funcionalidade.md` (roteiro que toda mudança no `index.html` segue)
- `index.html`, funções `carregar()` e `salvar()` (Grep por `localStorage`, por volta das linhas 417 a 445)
- `CLAUDE.md` (seções 5, 6 e 9)

## O que fazer
1. Implementar apenas as opções aprovadas, uma por vez. Exemplo para `navigator.storage.persist()`: chamar `navigator.storage.persist()` de forma protegida (se `navigator.storage` e `persist` existirem, dentro de `try/catch`), sem interromper o funcionamento se não houver suporte, sem alterar o formato de dados.
2. Acrescentar item ao `TESTES.md` e teste no `teste.js` quando for testável (por exemplo: a página abre sem erro mesmo sem `navigator.storage`).
3. Rodar `npm test`.

## Arquivos a criar ou alterar
- `index.html`, `teste.js`, `TESTES.md`

## Critério de pronto (verificável)
- [ ] `npm test` passa, com o mesmo total de testes anteriores mais os novos.
- [ ] `git diff --stat` mostra apenas os arquivos previstos.
- [ ] O Resultado descreve como o desenvolvedor confere no celular (item novo do `TESTES.md`).

## Cuidados
- Não alterar o modelo de dados nem a chave `crm-perfumes:dados`.
- Sem framework nem build. Não commitar sem confirmação; proponha a mensagem em português.

## Resultado
**Status: CONCLUIDA (2026-09-30).** Implementada somente a opção 3 (aviso de backup), conforme decisão da T09. Não foram implementados `persist()` nem importação de CSV.

**O que foi feito**
- `index.html`: nova chave `crm-perfumes:backup` (`{ultimo, primeiro}`, datas AAAA-MM-DD locais), separada de `crm-perfumes:dados`; modelo de dados intacto. Constante `DIAS_SEM_BACKUP = 7` no topo do script. Aviso no topo da tela com botão "Exportar agora". Ao exportar grava a data de hoje e o aviso some na hora. O primeiro uso é gravado ao salvar o primeiro registro (e ao abrir, para quem já tinha dados). Bloqueio do armazenamento ou chave ilegível: sem aviso e sem erro (a chave ilegível não é sobrescrita por cadastros; só é refeita ao exportar).
- Regra: aviso se houver lead ou venda e (última exportação com 7 dias ou mais, ou mês corrente diferente do da última exportação). Na virada do mês o texto cita o mês anterior. Decisão de interpretação: quem nunca exportou é contado só pela regra dos 7 dias a partir do primeiro uso (a regra do mês não se aplica, para não avisar um dia depois do primeiro cadastro).
- `teste.js`: 19 verificações novas (aviso com 8 dias, sem aviso recente, virada de mês com 2 dias, virada de ano, lista vazia, aviso some ao exportar, nunca exportou, primeiro cadastro, chave corrompida, armazenamento bloqueado). Datas simuladas trocando `Date` da janela do jsdom.
- `TESTES.md`: seção "Aviso de cópia de segurança", itens sem marcar `[x]`.
- Extras de documentação: pergunta 12 (relatório mensal) em `docs/roteiro-entrevista.md`; ideia "relatório mensal / fechamento do mês" e risco residual da importação de CSV em `.plano/PLANO.md`.

**Verificação:** `npm test` passou: 53 verificações, 0 falhas (eram 34). Nenhum servidor foi aberto.

**Como conferir no celular:** seção "Aviso de cópia de segurança" do `TESTES.md` (aviso não aparece no primeiro dia; simular data antiga; "Exportar agora" baixa o CSV e some o aviso; recarregar mantém sem aviso).

**Mensagem de commit proposta:** "Adiciona aviso de cópia de segurança quando faz 7 dias ou vira o mês sem exportar o CSV"
