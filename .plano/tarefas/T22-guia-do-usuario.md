# T22 — Escrever o guia de uso para o perfumista

**Fase:** 6 — Entrega
**Porte:** M
**Depende de:** T19 (endereço), T10 (proteção de dados), T13 se a entrevista ocorreu
**Executor:** executor-tarefa

## Contexto mínimo
O perfumista autônomo não é da área de tecnologia e usa o sistema principalmente pelo celular, entre atendimentos. O critério de conclusão exige que a rotina semanal de exportar o CSV seja explicada a ele. O guia deve ser curto, em português simples, e caber em uma mensagem de WhatsApp ou uma página impressa.

## Arquivos para ler
- `CLAUDE.md` (seções 1, 4, 5)
- `docs/pesquisa-armazenamento.md`
- `.plano/tarefas/T10-aplicar-protecao-dados.md` (Resultado)
- `.plano/tarefas/T19-ativar-github-pages.md` (Resultado, endereço)
- `index.html` (apenas os textos de botões e rótulos: Grep por `data-acao` e `<label`)

## O que fazer
1. Crie `docs/guia-do-usuario.md`, no máximo 2 páginas, com: (a) como abrir o sistema (endereço por extenso) e como colocá-lo na tela inicial do celular (passos para iPhone/Safari e Android/Chrome, conforme a pesquisa da T08); (b) como cadastrar uma pessoa interessada (só o nome é obrigatório); (c) o que significam as seis etapas do funil e que podem ser marcadas em qualquer ordem; (d) o botão "Lançar em vendas" quando a pessoa recebe o perfume; (e) como buscar; (f) **rotina semanal de backup**: todo dia fixo da semana tocar em "Exportar CSV" e guardar o arquivo (enviar para o próprio e-mail ou WhatsApp); (g) avisos: os dados ficam só neste aparelho e neste endereço; se limpar o navegador ou trocar de celular, perde tudo, por isso o backup; não usar o modo privado/anônimo; (h) a quem pedir ajuda (deixar "CONTATO DO DESENVOLVEDOR" como marcador a preencher pelo desenvolvedor).
2. Use os mesmos nomes de botões e etapas que aparecem na tela do sistema.
3. Explique cada termo técnico com analogia do dia a dia, ou evite o termo.
4. Se a proteção da T10 for "só documentação", inclua os passos aqui.

## Arquivos a criar ou alterar
- `docs/guia-do-usuario.md`

## Critério de pronto (verificável)
- [ ] O arquivo contém as seções (a) a (h); `grep -ci "exportar csv" docs/guia-do-usuario.md` maior que 0.
- [ ] O endereço publicado aparece por extenso.
- [ ] Os nomes dos botões citados existem em `index.html` (`grep` de cada nome confirma).
- [ ] O arquivo tem no máximo 120 linhas (`wc -l`).

## Cuidados
- Sem termos como localStorage, JavaScript, navegador em contexto técnico. Não prometer recursos que não existem (importar planilha, sincronizar entre aparelhos, lembretes).
- Marcador de contato fica para o desenvolvedor preencher. Não commitar; proponha a mensagem.

## Resultado
Status: CONCLUIDA (2026-09-30). Criado `docs/guia-do-usuario.md` (113 linhas) com as seções (a) a (h), centrado no iPhone/Safari (ícone da Tela de Início antes de cadastrar; o que fazer se já cadastrou no Safari; nota curta para Android). Backup explica Arquivos/Downloads, envio por WhatsApp/e-mail/iCloud Drive, aviso de 7 dias/virada de mês, e diz com franqueza que não há importação. Inclui a dica do `########` no Excel. Contato ficou como marcador "CONTATO DO DESENVOLVEDOR".

Verificação: `wc -l` = 113 (<= 120); `grep -ci "exportar csv"` = 2; endereço por extenso presente; todos os nomes de botões/etapas/rótulos citados foram conferidos em `index.html` (grep > 0 para cada um); sem termos técnicos (localStorage, JavaScript, cache).

Mensagem de commit proposta: "Adiciona o guia de uso para o perfumista (T22)"
