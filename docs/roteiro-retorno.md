# Roteiro de retorno após uma semana de uso

## Para que serve

Depois que o perfumista começar a usar o sistema, o desenvolvedor conversa com ele duas vezes: uma mensagem curta no 3º dia e uma conversa mais completa no 7º dia. O objetivo é descobrir o que funciona, o que atrapalha e o que falta. Com as respostas, cada suposição da seção 7.3 do `CLAUDE.md` vira CONFIRMADA ou REABERTA.

Observação: a entrevista inicial (`docs/roteiro-entrevista.md`) pode não ter acontecido antes da entrega. Nesse caso, este roteiro também faz o papel de confirmar o que ficou em aberto. Se `docs/respostas-entrevista.md` existir, conferir as respostas de lá antes de perguntar de novo o que ele já respondeu.

Regras da conversa: apenas perguntar e anotar as palavras dele. Não sugerir respostas, não prometer mudanças na hora.

## (a) Contatos combinados

Os dias são contados a partir do dia da entrega do sistema (dia 1 = dia da entrega).

| Quando | Como | Duração |
|--------|------|---------|
| 3º dia de uso | Mensagem de texto ou WhatsApp, com as perguntas da seção (b) | 5 minutos |
| 7º dia de uso | Conversa (presencial, chamada ou áudio), com as perguntas da seção (c) | 15 a 20 minutos |

## (b) Perguntas do 3º dia (por mensagem)

Enviar de forma curta e amigável, por exemplo: "Oi! Como está indo o sistema? Só três perguntinhas rápidas."

1. Você conseguiu abrir o sistema no celular sem dificuldade?
2. Alguma coisa travou, sumiu ou deu algum aviso na tela? Se sim, o que estava fazendo na hora?
3. O que você estranhou ou achou difícil de entender?
4. Você abriu o sistema hoje? (Importante para o iPhone, que pode apagar dados de sites que ficam vários dias sem abrir.)

Anotar as respostas na tabela de registro, ao final deste arquivo. Se ele relatar perda de dados ou erro de salvamento, tratar como urgente: pedir que exporte a planilha (CSV) imediatamente, se ainda houver algo na tela.

## (c) Perguntas do 7º dia (conversa)

Em palavras simples, nesta ordem:

**Uso geral**
1. Quantas pessoas você cadastrou nesta semana?
2. Quantas vendas você lançou?
3. O que faltou no sistema?
4. O que sobrou, isto é, o que você não usou ou achou desnecessário?
5. O que te confundiu?
6. Você usou pelo celular, entre um atendimento e outro? Ou acabou usando de outro jeito (computador, papel, caderno)?
7. Você continuou usando o caderno ou a planilha antiga ao mesmo tempo? Por quê?

**Cópia de segurança**
8. Você baixou a planilha (exportar) nesta semana? Conseguiu abrir? As letras com acento (ã, é, ç) apareceram certas?
9. Você toparia baixar essa planilha toda semana, como cópia de segurança?

**Campos que podem faltar**
10. Você precisou anotar alguma informação que não tem lugar no sistema? Por exemplo:
    - quanto custou fazer o frasco (preço de custo);
    - o tamanho do frasco vendido (30 ml, 50 ml, 100 ml);
    - a forma de pagamento;
    - depois de quanto tempo o cliente deve ser chamado de novo (prazo de recompra);
    - uma lista fixa dos seus perfumes para escolher, em vez de digitar (cadastro de produtos).
11. Você vende parcelado? Alguém já pagou metade e o resto depois?
12. Você produz só depois que o cliente encomenda, ou faz uma leva e deixa guardada? Sentiu falta de controlar quantos frascos tem prontos?

**Quem usa e onde**
13. Mais alguém precisou ver ou anotar algo no sistema nesta semana (sócio, ajudante, esposa)?
14. Você usou em mais de um aparelho ou programa de abrir sites? Os dados apareceram nos dois?
15. Seu site: você pensou em ligar com o sistema? Tem alguma novidade sobre quem cuida do site?

**Fechamento**
16. De 0 a 10, o quanto o sistema ajudou na semana? O que tornaria a nota maior?
17. Você continuaria usando?

## (d) Suposições de 7.3 e como testá-las

Preencher a coluna "Resposta" com as palavras dele e marcar CONFIRMADA ou REABERTA. Se o perfumista não souber responder, deixar em branco e marcar "SEM RESPOSTA" (a suposição segue como suposição).

| Suposição de 7.3 | Pergunta que a testa | Resposta | CONFIRMADA / REABERTA |
|------------------|----------------------|----------|-----------------------|
| 1. Só ele usa o sistema, em um único aparelho | 13 e 14 (mais alguém precisou ver ou anotar? usou em mais de um aparelho?) | | |
| 2. Texto livre basta para o perfume (sem cadastro de produtos) | 10 (precisou de uma lista fixa dos perfumes?) e 3 (o que faltou) | | |
| 3. O sistema não trata produção nem estoque | 12 (produz sob encomenda ou em lote? sentiu falta de controlar frascos prontos?) | | |
| 4. Pagamento à vista (um valor por venda, "pagou" sim ou não) | 11 (vende parcelado?) e 10 (forma de pagamento) | | |
| 5. Outros campos (preço de custo, tamanho do frasco, prazo de recompra) não são necessários | 10 (precisou anotar custo, tamanho, prazo?) e 3 (o que faltou) | | |
| 6. Sem integração com o site dele | 15 (pensou em ligar com o site? quem cuida do site?) | | |

Suposições da seção 6.3 (registrar também, pois a mesma conversa as testa):

| Suposição de 6.3 | Pergunta que a testa | Resposta | CONFIRMADA / REABERTA |
|------------------|----------------------|----------|-----------------------|
| Dados no navegador do celular, sem conta e sem servidor | 13, 14 e 2 do 3º dia (sumiu algum dado?) | | |
| Backup pela planilha (CSV), toda semana | 8 e 9 (baixou? abriu? toparia toda semana?) | | |
| Interface pensada para celular, usada entre atendimentos | 6 e 7 (usou pelo celular? ou voltou ao caderno?) | | |

## Como ver o uso real sem acessar dados privados

Os contatos e as vendas são informação do perfumista e dos clientes dele. O desenvolvedor não deve abrir o sistema do celular dele nem olhar os dados sem permissão. O método é:

1. **Pedir autorização antes.** Dizer com clareza o que será pedido e para quê: "Posso ver como você usou, só para melhorar o sistema? Você escolhe o que me mandar."
2. **Planilha exportada no 7º dia.** Pedir que ele exporte a planilha (CSV) e envie. Ela mostra quantos contatos e vendas existem, quais campos ficaram vazios e se o arquivo abre com acentos corretos. Se ele preferir, pode apagar ou trocar os nomes e telefones dos clientes antes de enviar; só a estrutura já ajuda.
3. **Captura de tela da tela inicial.** Pedir uma foto da tela inicial com os totais do mês. Ela mostra o uso sem expor a lista de clientes.
4. **Não guardar nada no repositório público.** A planilha e a captura de tela ficam fora do GitHub (o repositório é público). Guardar em pasta local do desenvolvedor, fora do projeto, e apagar depois da análise.

Se ele recusar qualquer item, seguir apenas com as respostas da conversa.

## Registro das respostas

### 3º dia

Data do contato:

| Pergunta | Resposta |
|----------|----------|
| 1. Conseguiu abrir? | |
| 2. Travou, sumiu ou deu aviso? | |
| 3. O que estranhou? | |
| 4. Abriu o sistema hoje? | |

### 7º dia

Data da conversa:

| Pergunta | Resposta |
|----------|----------|
| 1. Quantas pessoas cadastrou | |
| 2. Quantas vendas lançou | |
| 3. O que faltou | |
| 4. O que sobrou | |
| 5. O que confundiu | |
| 6. Usou pelo celular entre atendimentos | |
| 7. Continuou com o caderno ou planilha antiga | |
| 8. Exportou a planilha e conseguiu abrir | |
| 9. Toparia exportar toda semana | |
| 10. Campos que faltaram | |
| 11. Vende parcelado | |
| 12. Produz sob encomenda ou em lote | |
| 13. Mais alguém usou | |
| 14. Mais de um aparelho | |
| 15. Site | |
| 16. Nota de 0 a 10 | |
| 17. Continuaria usando | |

Autorização dada para ver: [ ] planilha exportada   [ ] captura da tela inicial

### Outras observações dele

