# Entrevista com o Giordano: site novo

3 perguntas, criadas em 06/10 depois da decisão de fazer um site novo do zero, em vez de reaproveitar o antigo (sem acesso). Cada uma tem um **exemplo** para explicar do que se trata. Pode ler o exemplo em voz alta.

**Regras da conversa:** só perguntar e anotar o que ele disser, com as palavras dele. Não sugerir resposta e não prometer prazo nem recurso.

**Por que isso importa:** as respostas 1 e 2 definem o tamanho, o custo e o endereço do site. A resposta 2 também define o endereço definitivo do CRM (seção 7.3, pergunta 6 do `CLAUDE.md`).

---

## 1. O site novo só mostra os perfumes ou também vende?

- O site antigo vendia ou só mostrava?
- Hoje o cliente fecha a compra falando com você no WhatsApp?

> **Exemplo:** "Tem dois jeitos. No primeiro, o site é uma vitrine: o cliente vê as fotos, os preços e clica em 'Quero este', que abre o seu WhatsApp com a mensagem pronta. Você combina o pagamento e a entrega como já faz hoje. No segundo, é uma loja completa: o cliente escolhe, paga e informa o endereço sozinho, como na Amazon. Qual dos dois você quer?"

**Por que importa:** a vitrine dá para fazer sozinho, em casa e de graça. A loja completa exige cobrança, frete e segurança do cartão, e provavelmente teria que ser uma plataforma pronta.

**Resposta (por mensagem, 06/10):** "tem que ver a logística! Se é fácil ou difícil aplicar o método de vendas."

*Anotação: não respondeu se quer vitrine ou loja completa; disse que depende da logística e de ser fácil aplicar o método de vendas. Pergunta ainda em aberto.*


---

## 2. Você quer um endereço com o nome da sua marca? O endereço do site antigo ainda é seu?

- Quem registrou o endereço do site antigo: você, uma agência ou um conhecido?
- Você sabe se ele está pago e até quando?

> **Exemplo:** "O endereço grátis seria algo como `rfcoder210.github.io/perfumes`. O endereço próprio seria algo como `www.essenciadanoite.com.br`, com o nome da sua marca, que custa cerca de R$ 40 por ano (valor a confirmar). É como a diferença entre um quiosque com o nome de outra pessoa e uma loja com o seu nome na fachada. Se o endereço do site antigo ainda for seu, dá para usar o mesmo nome no site novo e os clientes continuam te achando."

**Por que importa:** é a única parte que pode fugir do "tudo gratuito". Se ele ainda for dono do endereço antigo, talvez não precise pagar nada novo. Também decide o endereço definitivo do CRM.

**Resposta (por mensagem, 06/10):** "eu paguei aquele domínio gbparfum.com acho. Só pedir para Nicolas nova senha."

*Anotação: ele diz ter pago o domínio `gbparfum.com`, mas com dúvida ("acho"). O acesso depende do Nicolas, que ele indica como a pessoa a quem pedir uma nova senha. **Atualização (06/10, informada pelo desenvolvedor):** o Nicolas criou o site antigo. A senha que ele passou foi testada e deu como inválida, então o acesso ao site e ao domínio segue sem solução. Falta confirmar: se o domínio está no nome do Giordano, até quando está pago e onde está registrado (o acesso ao registro do domínio pode ser recuperado direto pelo Giordano, sem depender do Nicolas).*


---

## 3. (Decisão do desenvolvedor, só avisar) O site e o sistema de clientes ficam em lugares separados

> **Como explicar a ele:** "O sistema de clientes tem o nome e o telefone de todo mundo que comprou de você. O site é aberto ao público. Vou guardar os dois em lugares separados, para nenhum problema do site chegar aos dados dos seus clientes. É como a loja e o caderno de clientes: a loja fica aberta, e o caderno fica na gaveta trancada."

**Nota técnica (não precisa falar para ele):** repositórios separados no GitHub e origens separadas. Duas páginas na mesma origem (por exemplo, dois repositórios em `rfcoder210.github.io`) compartilham o `localStorage`, e o código do site conseguiria ler os dados do CRM.

**Resposta dele ao aviso:**
