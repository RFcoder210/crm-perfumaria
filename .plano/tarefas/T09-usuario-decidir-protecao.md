# T09 — AGUARDA USUÁRIO: decidir a proteção contra perda de dados

**Fase:** 3 — Proteção dos dados
**Porte:** P (decisão do desenvolvedor, cerca de 15 min)
**Depende de:** T08
**Executor:** AGUARDA USUÁRIO (decisão do desenvolvedor)

## Contexto mínimo
A T08 apresenta as opções de proteção contra apagamento dos dados no navegador. Escolher qual aplicar depende do aparelho do perfumista (iPhone ou Android), que hoje é desconhecido (é uma das perguntas da entrevista, T11/T12). Mudar o sistema é escolha do desenvolvedor.

## Arquivos para ler
- `docs/pesquisa-armazenamento.md`

## O que fazer (o desenvolvedor)
1. Ler a recomendação de `docs/pesquisa-armazenamento.md`.
2. Escolher, entre as opções listadas, quais aplicar antes da entrega. Sugestão do plano, se ele não tiver preferência: (a) instrução de adicionar à Tela de Início no guia de uso (só documentação), e (b) pedir armazenamento persistente com `navigator.storage.persist()` (poucas linhas). Um aviso na tela de "exportar o CSV" é uma mudança maior e só entra se ele quiser.
3. Informar ao orquestrador a decisão. O orquestrador anota o resultado abaixo.

## Arquivos a criar ou alterar
- Nenhum.

## Critério de pronto (verificável)
- [ ] A decisão está escrita na seção Resultado: lista das opções aprovadas (ou "nenhuma alteração de código").

## Cuidados
- Se a resposta for "só documentação", a T10 é marcada CONCLUIDA sem alterar código.
- Pode ser adiada até depois da entrevista (T12), se o aparelho do amigo mudar a escolha; nesse caso registre "adiada" e mantenha T10 PENDENTE.

## Resultado
Decidido em 2026-09-30 pelo desenvolvedor, sabendo que o perfumista usa iPhone:
- Aprovadas: opção 1 (usar só o ícone da Tela de Início; só orientação, vai para o guia T22) e opção 3 (aviso na tela quando a última exportação do CSV tem mais de 7 dias; implementação na T10).
- Não aprovadas agora: opção 2 (`navigator.storage.persist()`: ganho pequeno e incerto no Safari) e opção 4 (importar CSV: fora da ordem de trabalho; segue registrada como ideia futura e como risco residual: sem importação, o CSV não restaura dados).
- Base: no iPhone do desenvolvedor, o ícone guarda os dados e eles sobrevivem a fechar e reabrir, mas o ícone usa um armazenamento separado do Safari (registrado no TESTES.md em 2026-09-30).
- Informação nova da entrevista: o perfumista usa iPhone (informado pelo desenvolvedor; confirmar na entrevista T12).
