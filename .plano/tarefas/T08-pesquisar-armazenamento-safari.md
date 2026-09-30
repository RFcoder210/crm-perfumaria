# T08 — Pesquisar a regra atual de limpeza de dados do Safari e opções de proteção

**Fase:** 3 — Proteção dos dados
**Porte:** P
**Depende de:** nenhuma
**Executor:** executor-tarefa

## Contexto mínimo
O sistema guarda tudo no `localStorage` do navegador. O `CLAUDE.md` (seções 7.1 e 8, item 4) registra o risco: o Safari do iPhone pode apagar os dados de um site depois de cerca de sete dias de uso do navegador sem abrir o site. Analogia: é uma faxina automática que joga fora gavetas que ninguém abriu. Antes da entrega é preciso confirmar a regra vigente e como se proteger. Não se sabe ainda se o perfumista usa iPhone ou Android.

## Arquivos para ler
- `CLAUDE.md` (seções 6.3, 7.1 e 7.3)

## O que fazer
1. Pesquise (WebSearch/WebFetch, fontes oficiais: webkit.org, developer.apple.com, MDN) e responda, com link e data de cada fonte:
   a. Qual é a regra atual do Safari (iOS e macOS) para apagar dados de sites (Intelligent Tracking Prevention, limite de 7 dias)?
   b. Um site adicionado à Tela de Início (web app) está isento dessa regra?
   c. A chamada `navigator.storage.persist()` funciona no Safari e no Chrome Android, e o que ela garante?
   d. Como fica o Chrome no Android (limpeza de dados, modo economia)?
   e. O `localStorage` em endereço `github.io` é compartilhado com outros projetos do mesmo usuário GitHub? (mesma origem) Qual o risco?
2. Escreva `docs/pesquisa-armazenamento.md` com: resumo de 5 linhas, resposta a cada pergunta, e uma seção "Opções de proteção" listando, para cada opção, custo de implementação (nenhum código / poucas linhas em `index.html`) e eficácia. Opções mínimas a avaliar: instruir a adicionar à Tela de Início; pedir `navigator.storage.persist()`; aviso na tela quando a última exportação de CSV tem mais de 7 dias; botão de importar CSV (apenas listar como fora da ordem de trabalho).
3. Termine o documento com a recomendação em 3 linhas.

## Arquivos a criar ou alterar
- `docs/pesquisa-armazenamento.md` (criar a pasta `docs/` se não existir)

## Critério de pronto (verificável)
- [ ] O arquivo existe e contém as seções "Resumo", "Respostas" (5 itens a a e), "Opções de proteção" e "Recomendação".
- [ ] Cada resposta cita ao menos uma fonte com URL e data de consulta (`grep -c "http" docs/pesquisa-armazenamento.md` maior ou igual a 5).

## Cuidados
- Não alterar código. Se as fontes se contradisserem, diga isso explicitamente em vez de escolher uma.
- Explicar termos técnicos com analogia (o desenvolvedor é iniciante). Não commitar; proponha a mensagem.

## Resultado
CONCLUIDA em 30/09/2026.

**Feito:** pesquisa em fontes oficiais (WebKit, MDN, web.dev, Chrome for Developers, GitHub Docs) e redação de `docs/pesquisa-armazenamento.md` com Resumo, Respostas (a a e), Opções de proteção (4 opções) e Recomendação (3 itens).

**Achados principais:**
- Regra de 7 dias do ITP confirmada na página vigente da WebKit (conta dias de uso do Safari, não do calendário).
- Web app na Tela de Início é isento (WebKit). Que o ícone tenha armazenamento separado do Safari NÃO foi confirmado em fonte oficial: verificar no aparelho.
- `persist()` existe em Safari e Chrome; decisão automática do navegador; sem fonte de que proteja contra o limite de 7 dias.
- Chrome Android: só remoção por falta de espaço (LRU); risco maior é limpeza manual. Nada encontrado sobre "modo economia".
- `github.io`: projetos do mesmo usuário compartilham a origem e o `localStorage`.
- Contradição registrada: caniuse x MDN sobre versão do Chrome Android para `persist()` (irrelevante para o projeto).

**Arquivos:** `docs/pesquisa-armazenamento.md` (criado). Nenhum código alterado; nada commitado.

**Verificação:** `grep -c "http"` no arquivo = 20 (mínimo 5); `grep "^## "` mostra as seções Resumo, Respostas, Opções de proteção e Recomendação; `### a` a `### e` presentes.

**Mensagem de commit proposta:** `Adiciona pesquisa sobre armazenamento no Safari e opções de proteção dos dados`
