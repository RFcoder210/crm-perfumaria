# T06 — Registrar o resultado do teste no celular

**Fase:** 2 — Teste no celular
**Porte:** P
**Depende de:** T05
**Executor:** executor-tarefa

## Contexto mínimo
O desenvolvedor rodou o roteiro no celular (T05) e o orquestrador colou o relato dele na seção Resultado de `.plano/tarefas/T05-usuario-roteiro-no-celular.md`. Esta tarefa transforma o relato em registro permanente no `TESTES.md` e separa as falhas que exigem correção.

## Arquivos para ler
- `.plano/tarefas/T05-usuario-roteiro-no-celular.md` (seção Resultado)
- `TESTES.md`
- `CLAUDE.md` (seção 3, "Pendências")

## O que fazer
1. Marque `[x]` no `TESTES.md` somente nos itens que o relato diz OK. Itens FALHOU ou não informados permanecem `[ ]`.
2. Ao final do `TESTES.md`, crie a seção "## Registro de execuções" com uma linha: data (use `date +%F`), aparelho, navegador, endereço testado (local ou publicado), itens OK / FALHOU.
3. Crie a lista de falhas no Resultado desta tarefa: item, o que aconteceu, gravidade (impede uso / incômodo).
4. Se houver alguma falha, escreva também uma linha em `.plano/PENDENCIAS.md` por falha (tabela existente; destino: T07).
5. Proponha (sem editar) o texto para a seção 3 do `CLAUDE.md` retirando a pendência do celular, se tudo passou.

## Arquivos a criar ou alterar
- `TESTES.md`
- `.plano/PENDENCIAS.md` (só se houver falhas)

## Critério de pronto (verificável)
- [ ] `grep -c "\[x\]" TESTES.md` é igual ao número de itens OK do relato.
- [ ] `grep -n "Registro de execuções" TESTES.md` retorna a seção com a linha do teste no celular.
- [ ] Resultado contém a lista de falhas (ou a frase "nenhuma falha").

## Cuidados
- Não presumir OK para item que o relato não menciona.
- Não editar `CLAUDE.md`: só propor o texto. Não commitar; proponha a mensagem.

## Resultado
Executada em 2026-09-30.

**O que foi feito**
- `TESTES.md`: 30 dos 31 itens marcados como OK, com base no relato da T05 (iPhone/Safari, endereço local). Permanece desmarcado "Exportar o CSV e abrir no Excel ou Google Sheets", porque o CSV foi aberto só no VS Code. Os itens de acentuação e de duas seções foram marcados (conferidos no arquivo).
- Criada a seção "Registro de execuções" ao final do `TESTES.md`, com uma linha da execução e a lacuna anotada.
- `.plano/PENDENCIAS.md`: uma linha de pendência leve (Excel/Sheets), destino T22/entrega. Nenhuma linha por falha, pois não houve falhas.

**Lista de falhas:** nenhuma falha.

**Lacunas (não são falhas)**
- Abrir o CSV no Excel ou no Google Sheets (destino: T22/entrega).
- Adicionar à Tela de Início do iPhone não foi testado (relevante para a T09).

**Verificação**
- `grep -c "\[x\]" TESTES.md` retornou 30 (itens OK do relato, exceto o do Excel/Sheets).
- `grep -n "Registro de execuções" TESTES.md` retornou a linha 99, com a linha do teste no celular logo abaixo.

**Proposta de texto para a seção 3 do CLAUDE.md (não aplicada)**
Substituir a primeira pendência por:
"- **Confirmado em navegador real (iPhone/Safari, em 30/09/2026):** os dados sobreviveram ao recarregar a página e ao fechar e reabrir o navegador. Resta abrir o CSV no Excel ou no Google Sheets (até aqui só foi aberto no VS Code) e testar a adição à Tela de Início do iPhone."
A seção 8, item 1, pode passar a "Feito e confirmado no celular".

**Mensagem de commit proposta**
"Registra o resultado do roteiro de testes no iPhone e anota a lacuna do CSV no Excel"
