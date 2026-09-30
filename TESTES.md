# Roteiro de testes

Execute esta lista a cada alteração, antes de publicar. Marque o que passou.

## Cadastro

- [x] Cadastrar lead informando apenas o nome.
- [x] Cadastrar com nome contendo acento e apóstrofo (ex.: Márcia D'Ávila).
- [x] Tentar cadastrar sem nome: deve aparecer aviso, e nada deve ser gravado.
- [x] Depois de adicionar, conferir se o formulário ficou limpo.
- [x] Cadastrar venda informando apenas o nome do cliente.
- [x] Conferir se essa venda sem perfume mostra um traço na tabela.

## Funil

- [x] Marcar uma etapa do meio sem marcar as anteriores.
- [x] Desmarcar uma etapa já marcada.
- [x] Marcar "Entregue" e conferir se aparece o botão "Lançar em vendas".
- [x] Clicar em "Lançar em vendas" e conferir se o botão some e o selo aparece.
- [x] Conferir se o lead continua na lista depois de virar venda.

## Permanência dos dados

- [x] Recarregar a página e conferir se todos os registros voltaram.
- [x] Fechar o navegador, abrir de novo e conferir novamente.
- [x] Conferir se as etapas marcadas continuam marcadas após recarregar.

## Edição e exclusão

- [x] Editar um lead e salvar.
- [x] Editar um lead e cancelar no meio: nada deve mudar.
- [x] Editar um lead, digitar uma observação e, sem salvar, marcar uma etapa do
      funil: o texto digitado deve continuar no formulário.
- [x] Excluir um lead enquanto outro está em edição.
- [x] Confirmar que a exclusão pede confirmação antes de apagar.

## Busca

- [x] Buscar por nome, por perfume e por telefone.
- [x] Buscar um nome sem acento (ex.: "marcia") e conferir se acha "Márcia".
- [x] Buscar o telefone sem pontuação (ex.: "977776666") e conferir se acha.
- [x] Buscar termo inexistente e conferir a mensagem de lista vazia.
- [x] Ativar "Só pendentes" e conferir se os entregues somem da lista.

## Exportação

- [x] Exportar o CSV e abrir no Excel ou Google Sheets.
- [x] Conferir se a acentuação saiu correta no arquivo.
- [x] Conferir se leads e vendas aparecem nas duas seções do arquivo.

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

- [x] Abrir em tela de celular e conferir se os marcadores do funil são clicáveis.
- [x] Tocar no rótulo embaixo do marcador (MSG 1, PAGO…) e conferir se ele
      também marca a etapa.
- [x] Conferir se os formulários cabem na tela sem rolagem lateral.
- [x] Tocar no telefone de um lead e conferir se abre o WhatsApp.

## Aviso de cópia de segurança

Para conferir no iPhone (o teste automático simula as datas, mas não substitui
o aparelho). O aviso aparece no topo da tela quando há pelo menos um lead ou
venda e a última exportação tem 7 dias ou mais, ou já é outro mês.

- [ ] Com dados cadastrados e nenhuma exportação recente, conferir que o aviso
      NÃO aparece no mesmo dia em que começou a usar.
- [ ] Simular o aviso: no computador, abrir o console do navegador e rodar
      `localStorage.setItem('crm-perfumes:backup', JSON.stringify({ultimo:'2026-01-01', primeiro:'2026-01-01'}))`,
      recarregar e conferir que aparece o aviso em português, com o botão
      "Exportar agora". (No iPhone, esperar os 7 dias reais também vale.)
- [ ] Tocar em "Exportar agora": o CSV é baixado e o aviso some na hora.
- [ ] Recarregar a página e conferir que o aviso continua sem aparecer.
- [ ] Conferir que, sem nenhum lead ou venda, o aviso nunca aparece.

## Testes automatizados

Existe um teste automatizado em `teste.js`, que cobre parte desta lista. Para rodar:

```
npm install
npm test
```

Ele não substitui o roteiro manual: não vê o layout, não testa o celular e não abre o CSV.

## Registro de execuções

| Data | Aparelho | Navegador | Endereço testado | OK | FALHOU | Observações |
|---|---|---|---|---|---|---|
| 2026-09-30 | iPhone | Safari | local (http://192.168.0.79:8000/index.html) | 30 de 31 | 0 | Dados sobreviveram a recarregar e a fechar o navegador por completo. Telefone abriu o WhatsApp (número fictício). Lacuna: o CSV foi aberto no VS Code, não no Excel nem no Google Sheets; o item "Exportar o CSV e abrir no Excel ou Google Sheets" segue desmarcado. Acentuação e as duas seções (LEADS e VENDAS) foram conferidas no arquivo. Não testado: adicionar à Tela de Início do iPhone. |
| 2026-09-30 | PC (Windows) | Excel | arquivo `crm-perfumes.csv` exportado do iPhone | 1 (abrir o CSV no Excel) | 0 | Acentuação correta, colunas separadas e as duas seções (LEADS e VENDAS) corretas. A coluna de data mostra `########` enquanto estiver estreita: é só largura da coluna, não erro; basta alargá-la. |
| 2026-09-30 | iPhone | Ícone da Tela de Início (web app) | local (http://192.168.0.79:8000/index.html) | - | - | O sistema abriu **vazio** pelo ícone: os leads cadastrados no Safari não aparecem. Conclusão: o ícone e o Safari têm "armários" de dados separados. Não há como levar os dados de um para o outro (não existe importação de CSV). Falta conferir se um lead cadastrado pelo ícone sobrevive a fechar e reabrir. |
| 2026-09-30 | iPhone | Ícone da Tela de Início (web app) | local (http://192.168.0.79:8000/index.html) | 1 (permanência pelo ícone) | 0 | Um lead cadastrado pelo ícone sobreviveu a fechar o app e abrir de novo. O ícone guarda os dados de verdade; só não compartilha o armário com o Safari. |
