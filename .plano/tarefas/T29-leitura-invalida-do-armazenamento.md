# T29 — Tratar leitura inválida do armazenamento (JSON de formato errado e falha só na leitura)

**Fase:** 6 — Entrega (recomendada antes da T24)
**Porte:** P
**Depende de:** nenhuma (a T29 vem de `.plano/PENDENCIAS.md`, revisão do Dia 4; a primeira pendência dessa revisão já foi resolvida no commit `1bfdc4d`)
**Executor:** o desenvolvedor, com o comando `/funcionalidade` (mexe em `index.html`: plano curto e confirmação antes de editar, um commit por correção)

## Contexto mínimo
O risco principal do projeto é perder dados do perfumista, que ficam só no navegador. A trava `bloqueado` impede gravar por cima de dados ilegíveis, mas hoje ela só dispara quando o `JSON.parse` falha. Dois caminhos ainda deixam o sistema gravar por cima de dados que podem ser recuperáveis. Ambos foram marcados como **suspeita** (lidos no código, não executados) pelo subagente `revisor-dados`. Como o `bloqueado` agora também recusa cadastros (commit `1bfdc4d`), mudar quando ele dispara muda o que o usuário consegue fazer. Por isso a decisão do item B abaixo é do desenvolvedor.

## Arquivos para ler
- `index.html`: `carregar()` (linhas ~447-464), `salvar()` (~466-476), as ações `add-lead` e `add-venda` (~788-820)
- `teste.js`: o bloco "dados corrompidos não são sobrescritos" (~59-90) e o teste "armazenamento bloqueado" (~final do arquivo)
- `.plano/PENDENCIAS.md`: as duas entradas "Dados (suspeita)" de 2026-10-01
- `CLAUDE.md`, seção 3 (os três erros tratados) e seção 4 (modelo de dados)

## O que fazer
**Item A — JSON válido de formato errado** (`index.html` ~457-459)
1. Hoje `{}`, `[]`, `123` ou um objeto sem `leads` não ativam `bloqueado`; `estado` fica vazio e o próximo `salvar()` grava por cima do original.
2. Proposta: tratar como ilegível (`bloqueado = true` e o mesmo aviso) quando `d` não for um objeto, for uma lista, ou não tiver nenhuma das duas listas (`leads`, `vendas`).
3. **Cuidado de compatibilidade:** dados antigos com só uma das listas devem continuar abrindo (o código atual já aceita isso). Só bloqueie o que claramente não é o formato do CRM.
4. Teste que comprova: gravar `{"clientes":[1]}` em `crm-perfumes:dados`, tentar cadastrar um lead e conferir que o conteúdo original não foi perdido e que o aviso aparece. Repetir com `[]`.

**Item B — falha só na leitura (`getItem` lança erro)** (`index.html` ~450-454)
1. Hoje o `catch` mostra "nada será salvo" mas não marca `bloqueado`. Se a leitura falhar e a gravação funcionar (falha pontual), o aviso é falso e o primeiro cadastro sobrescreve os dados existentes.
2. **Armadilha de interação:** a mensagem atual diz "o sistema funciona, mas nada será salvo" (navegação anônima). Se o `catch` simplesmente marcar `bloqueado = true`, a trava nova de cadastro (commit `1bfdc4d`) passa a **recusar todo cadastro** nesse caso, e a mensagem deixa de ser verdadeira. O teste "armazenamento bloqueado: a página abre sem aviso de cópia" também precisa continuar passando.
3. **Decisão do desenvolvedor, antes de editar:**
   - (i) usar uma segunda trava só para gravação (por exemplo, não gravar quando a leitura falhou, mas deixar cadastrar na tela) e manter o texto atual; ou
   - (ii) tratar como `bloqueado` e mudar a mensagem para dizer que não dá para cadastrar; ou
   - (iii) não mudar nada, registrando que o caso é raro (leitura falha e gravação funciona) e fechar a pendência como "risco aceito".
4. Se (i) ou (ii): teste que simula só o `getItem` lançando erro com dados já salvos e `setItem` funcionando, e confere que a chave original não é sobrescrita.

## Arquivos a criar ou alterar
- `index.html` (`carregar()` e, conforme a decisão do item B, `salvar()` ou o texto do aviso)
- `teste.js` (testes novos, pelo `/novo-teste`)
- `.plano/PENDENCIAS.md` (marcar as duas entradas como RESOLVIDA, ou "risco aceito" no caso do item B-iii, com data e hash do commit)

## Critério de pronto (verificável)
- [ ] `npm test` passa, com testes novos para cada item corrigido.
- [ ] Para cada teste novo: desfazendo a correção por um instante, o teste falha (prova de que ele protege).
- [ ] Os testes antigos de dados ilegíveis, armazenamento bloqueado e backup corrompido continuam passando, sem alteração.
- [ ] `/checar-pronto` roda sem item "falhou". O que depender do celular fica listado como "não verificado".
- [ ] O subagente `revisor-dados` relê as categorias 3 e 4 e não acha mais as duas suspeitas.
- [ ] As duas entradas de `.plano/PENDENCIAS.md` estão atualizadas.

## Cuidados
- Um commit por correção, mensagem em português. Não enviar ao GitHub sem pedido.
- Não corrigir, nesta tarefa, as outras entradas abertas de `PENDENCIAS.md` (conversão em venda, exportação com dados bloqueados, "Apagar tudo", itens de celular).
- Não mudar o modelo de dados da seção 4 do `CLAUDE.md`.
- Se o desenvolvedor já tiver entregue o sistema (T24) quando esta tarefa for feita, lembrar que a correção só chega ao celular do perfumista depois da publicação no GitHub Pages.

## Resultado
(preenchido ao terminar: o que foi feito, arquivos alterados, evidência da verificação)
