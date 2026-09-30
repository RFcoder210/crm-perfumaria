# T14 — AGUARDA USUÁRIO: decidir o endereço definitivo do sistema

**Fase:** 4 — Requisitos e endereço
**Porte:** P (decisão, cerca de 15 min)
**Depende de:** T11 (e, preferencialmente, T13)
**Executor:** AGUARDA USUÁRIO (decisão do desenvolvedor, com o amigo se ele mexe no site)

## Contexto mínimo
Os dados do navegador ficam presos ao endereço em que o sistema é aberto (cada endereço tem o seu próprio "armário" de dados) e ainda não existe importação de CSV. Se o endereço mudar depois da entrega, o sistema abre vazio. Por isso o endereço definitivo precisa ser decidido antes de publicar para o amigo. Opções (`CLAUDE.md`, 7.3, pergunta 6): (A) manter o GitHub Pages, no formato `https://SEU-USUARIO.github.io/NOME-DO-REPOSITORIO/`; (B) apontar um subdomínio do site dele para o GitHub Pages (por exemplo `controle.site-dele.com.br`), o que exige acesso ao painel de domínio; (C) colocar em uma pasta do site dele, não recomendado (os códigos do site teriam acesso aos dados dos clientes).

## Arquivos para ler
- `CLAUDE.md` (seção 7.3, pergunta 6)
- `docs/respostas-entrevista.md` (se existir)

## O que fazer (o desenvolvedor)
1. Escolher A, B ou C. Recomendação do plano: A, por ser gratuita, sem depender de terceiros e sem risco para os dados; B só se o amigo quiser e o desenvolvedor tiver acesso ao domínio.
2. Definir o nome do repositório (sem espaços ou acentos; sugestão: `crm-perfumaria`). O nome do repositório entra no endereço.
3. Definir se o repositório será público. Nota: o GitHub Pages gratuito exige repositório público em conta gratuita.
4. Informar as decisões ao orquestrador, que as anota abaixo e no `PLANO.md`.

## Arquivos a criar ou alterar
- Nenhum.

## Critério de pronto (verificável)
- [ ] A seção Resultado registra: opção (A/B/C), nome do repositório, visibilidade e o endereço final esperado, escrito por extenso.

## Cuidados
- Se escolher B, a T20 (subdomínio) passa a ser obrigatória. Se escolher A, a T20 é marcada CONCLUIDA como "não se aplica".
- Não criar nada na internet neste passo.

## Resultado
Decidido em 2026-09-30 pelo desenvolvedor:
- Opção: A (GitHub Pages).
- Nome do repositório: `crm-perfumaria`.
- Visibilidade: pública (exigência do GitHub Pages gratuito).
- Endereço final esperado: https://SEU-USUARIO.github.io/crm-perfumaria/ (o usuário GitHub será registrado na T17).
- T20 (subdomínio) não se aplica: marcar CONCLUIDA como "não se aplica".
