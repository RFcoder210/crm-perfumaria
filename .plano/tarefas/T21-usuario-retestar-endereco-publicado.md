# T21 — AGUARDA USUÁRIO: repetir o teste no celular no endereço publicado

**Fase:** 5 — Publicação
**Porte:** M (cerca de 45 min a 1 h do desenvolvedor, mais 15 min do executor para registrar)
**Depende de:** T19 (e T20 se aplicável)
**Executor:** o desenvolvedor executa (AGUARDA USUÁRIO); depois o executor-tarefa registra

## Contexto mínimo
O endereço publicado tem "armário" de dados próprio e usa https. É o ambiente real que o perfumista usará. Critérios de conclusão: dados sobrevivem ao recarregar e a fechar/reabrir o navegador no celular, e o CSV abre com acentuação correta.

## Arquivos para ler
- `TESTES.md`
- Endereço registrado no Resultado da T19 (ou T20)

## O que fazer
1. (Desenvolvedor) No celular, abrir o endereço publicado. Rodar o roteiro completo do `TESTES.md`, com atenção a: permanência dos dados (fechar o navegador por completo e reabrir), marcadores do funil clicáveis, telefone abrindo o WhatsApp, exportação do CSV, e a aparência dos formulários sem rolagem lateral.
2. (Desenvolvedor) Se a T10 aplicou alguma proteção (por exemplo adicionar à Tela de Início), testar esse item também.
3. (Desenvolvedor) Ao terminar, apagar os dados de teste do celular usando o botão "Apagar tudo" do próprio sistema (ele pede confirmação), para o sistema abrir vazio na entrega. Se o teste foi feito no celular do próprio desenvolvedor, isso basta.
4. (Desenvolvedor) Informar OK/FALHOU por item ao orquestrador.
5. (Executor) Marcar os itens no `TESTES.md`, acrescentar linha na seção "Registro de execuções" (data, aparelho, navegador, endereço publicado) e registrar falhas em `.plano/PENDENCIAS.md`. Se houver falhas, o orquestrador cria uma tarefa de correção nos moldes da T07 e repete esta tarefa.

## Arquivos a criar ou alterar
- `TESTES.md`, `.plano/PENDENCIAS.md` (se houver falha)

## Critério de pronto (verificável)
- [ ] Todos os itens do `TESTES.md` estão marcados `[x]` e a linha de registro cita o endereço publicado.
- [ ] O desenvolvedor confirmou que apagou os dados de teste.

## Cuidados
- Não presumir OK para item não informado. Não commitar sem confirmação.

## Resultado
(preenchido pelo executor)
