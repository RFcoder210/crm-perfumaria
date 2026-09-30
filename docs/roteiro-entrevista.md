# Roteiro da entrevista com o perfumista

## Antes de começar

- Objetivo: confirmar com o perfumista o que ele realmente precisa, porque hoje tudo no sistema é suposição do desenvolvedor.
- Mostrar o sistema aberto no celular dele (ou no meu), cadastrando um contato de exemplo e marcando as etapas, para ele reagir ao que vê.
- Apenas perguntar e anotar. Não sugerir respostas nem prometer mudanças durante a conversa. Pode ser presencial ou por mensagem de voz/texto.

## Perguntas

Legenda: **[PRIORIDADE: decide arquitetura e endereço]** marca as perguntas que precisam ser respondidas primeiro.

| Nº | Pergunta | Em palavras simples para o perfumista | O que a resposta decide no sistema | Suposição atual |
|----|----------|----------------------------------------|-------------------------------------|-----------------|
| 1 | **[PRIORIDADE: decide arquitetura e endereço]** Mais alguém vai usar o sistema? | "Só você vai mexer nos contatos e nas vendas, ou outra pessoa também (sócio, ajudante, esposa)? Ela precisaria ver ou anotar vendas de outro celular?" | Se só ele usa, os dados podem ficar no próprio celular, sem conta e sem servidor. Se outra pessoa usa, é preciso guardar os dados online, o que muda o projeto inteiro. | Só ele usa, em um único aparelho. |
| 2 | Cadastro de produtos | "Você tem uma lista fixa dos perfumes que faz, ou cada venda é um perfume diferente? Seria útil escolher o perfume de uma lista em vez de digitar toda vez?" | Se o campo "perfume" continua texto livre ou vira uma lista de produtos cadastrados. | Texto livre basta. |
| 3 | Produção | "Você fabrica só quando o cliente encomenda, ou faz uma leva e deixa guardada para vender? Precisa controlar quantos frascos tem prontos?" | Se o sistema precisa tratar produção e estoque ou apenas registrar contatos e vendas. | O sistema não trata produção nem estoque. |
| 4 | Forma de pagamento | "O cliente paga tudo de uma vez ou você parcela? Já aconteceu de alguém pagar metade e o resto depois?" | Se "pagou" continua sendo sim ou não e a venda continua com um único valor, ou se é preciso registrar parcelas. | Pagamento à vista. |
| 5a | Preço de custo | "Você quer anotar quanto gastou para fazer cada frasco, para saber o lucro?" | Se entra o campo de custo (e, no futuro, o cálculo de lucro). | Não tem campo de custo. |
| 5b | Tamanho do frasco | "Você vende frascos de tamanhos diferentes (por exemplo 30 ml, 50 ml, 100 ml)? Precisa anotar qual tamanho o cliente levou?" | Se entra um campo de tamanho do frasco na venda. | Não tem campo de tamanho. |
| 5c | Prazo de recompra | "Depois de quanto tempo um cliente costuma querer outro frasco? Quer que o sistema te lembre de chamar o cliente de novo?" | Se entra um prazo de recompra e um lembrete (hoje fora do escopo). | Não tem prazo nem lembrete. |
| 6 | **[PRIORIDADE: decide arquitetura e endereço]** Site dele: integrar ou não | "Você já tem um site? Quer que este sistema fique ligado a ele ou separado, como um aplicativo à parte?" (ver as três opções de endereço, abaixo) | Decide o endereço definitivo onde o sistema vai ficar e se haverá ligação com o site. Os dados ficam presos ao endereço em que o sistema é aberto; mudar de endereço depois faz o sistema abrir vazio. | Sem integração com o site; endereço ainda em aberto. |
| 6a | Site vende online | "O seu site vende? O cliente consegue comprar e pagar ali? Em qual plataforma foi feito e quem cuida dele (você, um profissional, uma agência)?" | Se a plataforma do site já guarda clientes e pedidos (duplicaria parte deste sistema) e se dá para criar um endereço ligado ao site. Quem administra o site decide quem pode criar o subdomínio. | Não sabemos; sem integração. |
| 7 | **[PRIORIDADE: decide arquitetura e endereço]** Celular e programa de abrir sites | "Seu celular é iPhone ou Android? Qual programa você usa para abrir sites (Safari, Chrome, outro)?" | No iPhone, o Safari pode apagar os dados de sites que ficam alguns dias sem abrir; isso decide a proteção dos dados e se o sistema precisa ser instalado na tela inicial. No Android o risco é menor. | Não sabemos. |
| 8 | Limpeza e troca de aparelho | "Você costuma limpar o histórico ou os dados do celular para liberar espaço? Pretende trocar de celular em breve?" | O quanto a perda de dados é um risco real e com que frequência é preciso guardar uma cópia. | Raramente limpa e não troca de aparelho logo. |
| 9 | Volume | "Quantas pessoas novas te procuram por mês, e quantas vendas você fecha por mês, mais ou menos?" | Se o sistema simples dá conta ou se precisa de mais recursos (busca, filtros, organização por período). Hoje centenas de registros não pesam. | Dezenas de contatos por mês. |
| 10 | WhatsApp | "Você conversa com os clientes pelo WhatsApp? É por ele que chama quem ainda não comprou?" | Se o número de telefone vira link direto para o WhatsApp (já existe hoje) e se vale incluir mensagens prontas no futuro. | Usa WhatsApp. |
| 11 | Cópia semanal em planilha | "O sistema consegue baixar uma planilha com todos os seus contatos e vendas. Você toparia baixar essa planilha uma vez por semana, como uma cópia de segurança? Você abre planilha no celular (Excel, Google Planilhas)?" | Se a cópia de segurança pela planilha é realista ou se precisa de outra proteção (ex.: guardar os dados online). | Ele exporta a planilha toda semana. |

## Opções de endereço (pergunta 6)

O endereço é o "lugar" onde o sistema abre. Os dados ficam presos a ele, e hoje não existe como importar uma planilha de volta.

| Opção | Em palavras simples | O que o desenvolvedor precisa saber |
|-------|---------------------|--------------------------------------|
| A. Manter no GitHub Pages | O sistema fica em um endereço gratuito do GitHub, separado do site dele (algo como nome.github.io/crm-perfumaria). | Mais simples e gratuito, e já está no plano. O endereço não tem o nome da marca dele. Se depois quiser mudar para outro endereço, os dados do celular não acompanham. |
| B. Subdomínio do site dele | Um endereço da marca dele (ex.: vendas.seusite.com.br) que aponta para o sistema no GitHub Pages. | Exige acesso ao painel de domínio do site (quem administra o site cria uma entrada no DNS). Quem administra precisa colaborar. Fica com cara profissional e mantém o sistema separado do site. Decidir antes da entrega, porque trocar depois faz o sistema abrir vazio. |
| C. Pasta dentro do site dele | O sistema fica dentro do próprio site (ex.: seusite.com.br/vendas). | **Não recomendada.** Os códigos do site teriam acesso aos dados dos clientes, porque compartilham o mesmo endereço base. Depende da plataforma do site aceitar arquivos próprios e de quem a administra. |

## Como registrar

Preencher durante a conversa. Anotar as palavras dele, sem interpretar.

### Pergunta 1 — Mais alguém vai usar o sistema? [PRIORIDADE]
Resposta:


### Pergunta 2 — Cadastro de produtos
Resposta:


### Pergunta 3 — Produção
Resposta:


### Pergunta 4 — Forma de pagamento
Resposta:


### Pergunta 5a — Preço de custo
Resposta:


### Pergunta 5b — Tamanho do frasco
Resposta:


### Pergunta 5c — Prazo de recompra
Resposta:


### Pergunta 6 — Site dele: integrar ou não [PRIORIDADE]
Resposta (e opção de endereço preferida: A, B ou C):


### Pergunta 6a — Site vende online, plataforma e quem administra
Resposta:


### Pergunta 7 — iPhone ou Android, e programa usado [PRIORIDADE]
Resposta:


### Pergunta 8 — Limpeza de dados e troca de aparelho
Resposta:


### Pergunta 9 — Volume de contatos e vendas por mês
Resposta:


### Pergunta 10 — WhatsApp
Resposta:


### Pergunta 11 — Cópia semanal em planilha
Resposta:


### Outras observações dele
Resposta:

