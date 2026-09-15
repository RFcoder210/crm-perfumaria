# Roteiro de testes

Execute esta lista a cada alteração, antes de publicar. Marque o que passou.

## Cadastro

- [ ] Cadastrar lead informando apenas o nome.
- [ ] Cadastrar com nome contendo acento e apóstrofo (ex.: Márcia D'Ávila).
- [ ] Tentar cadastrar sem nome: deve aparecer aviso, e nada deve ser gravado.
- [ ] Cadastrar venda informando apenas o nome do cliente.

## Funil

- [ ] Marcar uma etapa do meio sem marcar as anteriores.
- [ ] Desmarcar uma etapa já marcada.
- [ ] Marcar "Entregue" e conferir se aparece o botão "Lançar em vendas".
- [ ] Clicar em "Lançar em vendas" e conferir se o botão some e o selo aparece.
- [ ] Conferir se o lead continua na lista depois de virar venda.

## Permanência dos dados

- [ ] Recarregar a página e conferir se todos os registros voltaram.
- [ ] Fechar o navegador, abrir de novo e conferir novamente.
- [ ] Conferir se as etapas marcadas continuam marcadas após recarregar.

## Edição e exclusão

- [ ] Editar um lead e salvar.
- [ ] Editar um lead e cancelar no meio: nada deve mudar.
- [ ] Excluir um lead enquanto outro está em edição.
- [ ] Confirmar que a exclusão pede confirmação antes de apagar.

## Busca

- [ ] Buscar por nome, por perfume e por telefone.
- [ ] Buscar termo inexistente e conferir a mensagem de lista vazia.
- [ ] Ativar "Só pendentes" e conferir se os entregues somem da lista.

## Exportação

- [ ] Exportar o CSV e abrir no Excel ou Google Sheets.
- [ ] Conferir se a acentuação saiu correta no arquivo.
- [ ] Conferir se leads e vendas aparecem nas duas seções do arquivo.

## Celular

- [ ] Abrir em tela de celular e conferir se os marcadores do funil são clicáveis.
- [ ] Conferir se os formulários cabem na tela sem rolagem lateral.
- [ ] Tocar no telefone de um lead e conferir se abre o WhatsApp.

## Testes automatizados

Existe um teste automatizado em `teste.js`, que cobre parte desta lista. Para rodar:

```
npm install
node teste.js
```

Ele não substitui o roteiro manual: não vê o layout, não testa o celular e não abre o CSV.
