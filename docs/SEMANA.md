# Esboço da semana — CRM Perfumaria

Criado em 29/09/2026 (terça). Cobre de **quarta 30/09 a domingo 04/10**.
É uma previsão: o dia real depende da cota de uso e do que você conseguir fazer. As tarefas mudam de status em `.plano/ESTADO.md`.

Legenda: 🤖 feito pelos agentes · 👤 depende de você · ⏳ espera externa

---

## Onde estamos

- Plano aprovado: 28 tarefas em 7 fases.
- Ambiente pronto (Node, testes, Git, Python).
- Tarefas concluídas: 0 de 28.
- Sem prazo final. Você trabalha de segunda a sexta, 3 h por dia, com margem no fim de semana.
- Commits liberados para os agentes. **Envio ao GitHub continua travado** até você escrever "CONFIRMO enviar ao GitHub".

---

## Quarta, 30/09 — Base local

Como começar: abrir sessão nova e rodar `/orquestrar`.

- 🤖 **T01** — Conferir que os testes automáticos passam e ajustar o comando no `TESTES.md`.
- 🤖 **T02** — Limpar o `teste.js` (remover três páginas de teste que nunca são usadas).
- 🤖 **T03** — Criar um teste que confere o conteúdo do arquivo CSV exportado.
- 🤖 **T04** — Se sobrar cota: guia para abrir o sistema no celular.

Resultado esperado: fase 1 quase toda pronta, cada tarefa com seu commit.

---

## Quinta, 01/10 — Preparar o teste no celular

- 🤖 **T04** — Guia do celular, se ainda não estiver feito.
- 👤 **T05** — **Você testa no celular.** Antes, deixe pronto:
  - o celular no mesmo Wi-Fi do computador;
  - uma regra no Firewall do Windows para o Python (o guia da T04 explica).
- 🤖 **T06** — Registrar o resultado no `TESTES.md` e listar o que falhou.

Se você não puder testar no celular na quinta, os agentes seguem com as tarefas da sexta.

---

## Sexta, 02/10 — Pesquisa e entrevista

- 🤖 **T08** — Pesquisar a regra de limpeza de dados do Safari (iPhone) e como proteger os dados.
- 🤖 **T11** — Preparar o roteiro da entrevista com o perfumista.
- 🤖 **T07** — Corrigir o que falhou no celular, só se houver falhas.

---

## Fim de semana, 03 e 04/10 — margem

Sem tarefa fixa. Dá para:
- 👤 Marcar a entrevista com o perfumista (T12).
- 👤 Pegar o endereço correto do site dele. `gbparfum.com` não existe no DNS: pode haver letra trocada.
- 👤 Ler o resultado da pesquisa do Safari (T08) e pensar em qual proteção prefere (T09).

---

## O que só você pode fazer

Nada disso é feito por agente:
1. **T05** — testar no celular (Wi-Fi e Firewall).
2. **T09** — escolher a proteção contra a limpeza do Safari.
3. **T12** — realizar a entrevista. Já falhou uma vez: marcar cedo.
4. **T14** — decidir o endereço definitivo do sistema.
5. **T17 a T21** — conta e repositório no GitHub, envio, ativar o GitHub Pages.
6. **T24** — entregar ao perfumista.
7. **T25** — acompanhar a semana de uso.

---

## Depois desta semana (visão geral)

- **Fase 4:** entrevista e endereço (T11 a T14).
- **Fase 5:** publicação no GitHub Pages (T15 a T21). Antes de publicar, um agente audita o que ficará público, porque o repositório público mostraria `CLAUDE.md`, `.plano/` e seu e-mail pessoal nos commits.
- **Fase 6:** guia de uso e entrega ao perfumista (T22 a T24).
- **Fase 7:** uma semana de uso real (7 dias corridos), retorno, ajustes de campos e fechamento (T25 a T28).

Estimativa total: 8 a 10 dias de trabalho de 3 h, mais as esperas (uma semana de uso, agenda da entrevista, e propagação do domínio se houver subdomínio).

---

## Decisões ainda abertas

- Endereço definitivo: GitHub Pages padrão (recomendado), subdomínio do site dele, ou pasta do site (não recomendado). Falta também o nome do repositório.
- Proteção contra a limpeza de dados do Safari.
- O que fazer com os arquivos `.claude - Copia/` e `CLAUDE - Copia.md` (ninguém mexe neles).
- Ajustes de campos: só depois da semana de uso.

---

## Riscos que valem acompanhar

- **Entrevista não acontecer:** seguimos com as suposições atuais, e você aceita esse risco na entrega.
- **Perda de dados:** se o perfumista limpar o navegador ou trocar de celular, perde tudo. Por isso a rotina semanal de exportar o CSV.
- **Trocar de endereço depois da entrega:** o sistema abriria vazio, porque não existe importação de CSV. Por isso o endereço é decidido antes.
- **Cota do plano Pro:** se acabar no meio do dia, retomamos no dia seguinte pela tarefa parada.
