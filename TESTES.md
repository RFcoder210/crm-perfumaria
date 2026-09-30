# Roteiro de testes

Execute esta lista a cada alteração, antes de publicar. Marque o que passou.

## Cadastro

- [ ] Cadastrar lead informando apenas o nome.
- [ ] Cadastrar com nome contendo acento e apóstrofo (ex.: Márcia D'Ávila).
- [ ] Tentar cadastrar sem nome: deve aparecer aviso, e nada deve ser gravado.
- [ ] Depois de adicionar, conferir se o formulário ficou limpo.
- [ ] Cadastrar venda informando apenas o nome do cliente.
- [ ] Conferir se essa venda sem perfume mostra um traço na tabela.

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
- [ ] Editar um lead, digitar uma observação e, sem salvar, marcar uma etapa do
      funil: o texto digitado deve continuar no formulário.
- [ ] Excluir um lead enquanto outro está em edição.
- [ ] Confirmar que a exclusão pede confirmação antes de apagar.

## Busca

- [ ] Buscar por nome, por perfume e por telefone.
- [ ] Buscar um nome sem acento (ex.: "marcia") e conferir se acha "Márcia".
- [ ] Buscar o telefone sem pontuação (ex.: "977776666") e conferir se acha.
- [ ] Buscar termo inexistente e conferir a mensagem de lista vazia.
- [ ] Ativar "Só pendentes" e conferir se os entregues somem da lista.

## Exportação

- [ ] Exportar o CSV e abrir no Excel ou Google Sheets.
- [ ] Conferir se a acentuação saiu correta no arquivo.
- [ ] Conferir se leads e vendas aparecem nas duas seções do arquivo.

## Como abrir no celular (teste antes de publicar)

Um servidor local é como abrir uma janelinha na sua casa para o celular
espiar: o computador "serve" o `index.html` pela rede Wi-Fi, e só quem está
no mesmo Wi-Fi enxerga.

1. Deixe o computador e o celular no mesmo Wi-Fi.
2. No computador, abra o terminal na pasta do projeto e rode:
   `py -m http.server 8000 --bind 0.0.0.0`
   (o terminal fica "ocupado"; é normal, o servidor está rodando).
3. Em outro terminal, descubra o endereço do computador com `ipconfig` e
   procure a linha "Endereço IPv4" do adaptador Wi-Fi (algo como
   `192.168.0.79`).
4. No celular, abra o navegador e digite `http://IPV4:8000/index.html`,
   trocando IPV4 pelo número encontrado (exemplo:
   `http://192.168.0.79:8000/index.html`).
5. Se não abrir, o Firewall do Windows pode estar bloqueando. Quando o
   Windows perguntar, permita o Python em redes privadas. Depois tente de
   novo.
6. Ao terminar, volte ao terminal do servidor e pare com Ctrl+C.

Os dados salvos nesse endereço ficam separados dos dados do endereço
publicado depois: cada endereço tem seu próprio "armário" de dados no
navegador.

**Aviso:** este teste usa `http`, não `https`. O `localStorage` funciona
assim, mas se algum recurso exigir `https`, isso será conferido depois da
publicação (tarefa T21).

## Celular

- [ ] Abrir em tela de celular e conferir se os marcadores do funil são clicáveis.
- [ ] Tocar no rótulo embaixo do marcador (MSG 1, PAGO…) e conferir se ele
      também marca a etapa.
- [ ] Conferir se os formulários cabem na tela sem rolagem lateral.
- [ ] Tocar no telefone de um lead e conferir se abre o WhatsApp.

## Testes automatizados

Existe um teste automatizado em `teste.js`, que cobre parte desta lista. Para rodar:

```
npm install
npm test
```

Ele não substitui o roteiro manual: não vê o layout, não testa o celular e não abre o CSV.
