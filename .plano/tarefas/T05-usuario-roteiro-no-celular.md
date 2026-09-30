# T05 — AGUARDA USUÁRIO: rodar o roteiro de testes no celular

**Fase:** 2 — Teste no celular
**Porte:** M (cerca de 1 h a 1 h30 do desenvolvedor)
**Depende de:** T03, T04
**Executor:** AGUARDA USUÁRIO (o desenvolvedor, com o próprio celular; nenhum agente pode fazer isto)

## Contexto mínimo
Critério de conclusão do projeto: o roteiro do `TESTES.md` passa inteiro em navegador real e no celular, e os dados sobrevivem a recarregar e a fechar/reabrir o navegador. O teste automático (jsdom) não vê layout nem celular. Esta é a pendência principal do `CLAUDE.md` (seção 3). O roteiro já foi rodado no navegador do computador (informado no OBJETIVO), mas sem registro item a item.

## Arquivos para ler
- `TESTES.md` (seções "Como abrir no celular" e todas as demais)

## O que fazer (o desenvolvedor)
1. Seguir a seção "Como abrir no celular" do `TESTES.md` e abrir o sistema no celular.
2. Rodar o roteiro inteiro no celular, item por item, anotando OK ou FALHOU (com uma frase do que aconteceu ou uma captura de tela). Atenção especial: "Fechar o navegador, abrir de novo e conferir" (fechar o app do navegador por completo, não só a aba).
3. Exportar o CSV no celular e verificar onde o arquivo foi salvo. Abrir o CSV no Excel ou no Google Sheets (pode ser no computador) e conferir a acentuação e as duas seções (LEADS e VENDAS).
4. Informar qual celular e navegador usou (ex.: iPhone/Safari, Android/Chrome).
5. Confirmar se o roteiro no navegador do computador (seções fora de "Celular") passou, para registro.
6. Entregar o resultado ao orquestrador (pode ser por mensagem, itens numerados ou fotos). Não é preciso editar arquivos.

## Arquivos a criar ou alterar
- Nenhum (o registro é feito na T06).

## Critério de pronto (verificável)
- [ ] O desenvolvedor informou OK/FALHOU para cada item do `TESTES.md`, incluindo aparelho e navegador.
- [ ] Foi informado se o CSV abriu com acentuação correta.

## Cuidados
- Não publicar nada na internet neste passo; é só rede local.
- O apagamento de dados de teste no celular não é necessário agora (este endereço é separado do definitivo).

## Resultado
Relato do desenvolvedor em 2026-09-30:
- Aparelho e navegador: iPhone com Safari.
- Endereço testado: local (http://192.168.0.79:8000/index.html, servidor `py -m http.server`).
- Todos os itens do roteiro do `TESTES.md` funcionaram (cadastro, funil, permanência, edição e exclusão, busca, exportação, celular).
- Permanência: os dados continuaram lá após recarregar e após fechar o navegador por completo e abrir de novo.
- Telefone: o toque no número abriu o WhatsApp normalmente (foi usado número fictício, por segurança).
- CSV: gerado pelo botão de exportar (Downloads/crm-perfumes.csv). Foi aberto no VS Code, NÃO no Excel nem no Google Sheets, e estava correto. Conferido pelo orquestrador: BOM UTF-8 presente, acentos íntegros, seções LEADS e VENDAS, separador `;`, datas dd/mm/aaaa.
- Não informado: teste de adicionar à Tela de Início do iPhone (relevante para a T09).
- Lacuna: a abertura do CSV no Excel ou no Google Sheets ainda não foi feita.
