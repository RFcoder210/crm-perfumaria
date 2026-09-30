# CRM Perfumaria

Sistema simples de controle de vendas de perfumes, feito para um perfumista autônomo que fabrica as próprias fragrâncias e vende frascos fechados.
Ele acompanha quem demonstrou interesse (leads) e registra o que cada cliente comprou, quando e por quanto.
Foi pensado para o celular, em português, e funciona sem servidor, sem cadastro e sem instalação.

## Funcionalidades

- **Leads com funil de seis etapas:** mandei mensagem, mandei de novo, encomendou, pagou, recebeu e recomprou. As etapas são independentes: podem ser marcadas e desmarcadas em qualquer ordem.
- **Vendas:** histórico de compras por cliente, com perfume, data e valor. Um lead que já recebeu o perfume pode ser lançado em vendas com um botão (o lead não é apagado, o histórico de contato fica).
- **Famílias olfativas:** cada perfume pertence a uma família (floral, cítrico, amadeirado, âmbar, fougère, chipre, aquático, gourmand), com cor própria nos cartões.
- **Busca sem acento:** procurar por "marcia" encontra "Márcia".
- **Totais do mês corrente** no topo da tela.
- **Exportar CSV**, que abre no Excel ou no Google Sheets e serve de backup.
- **Dados guardados no próprio navegador** (`localStorage`), sem enviar nada para a internet.
- Toda exclusão pede confirmação.

## Como usar

Abra o sistema neste endereço: https://rfcoder210.github.io/crm-perfumaria/

No celular, dá para adicionar a página à tela inicial para abrir como se fosse um aplicativo. Os dados ficam no aparelho e no navegador em que foram cadastrados; por isso, exporte o CSV com regularidade (uma vez por semana é uma boa rotina).

## Como rodar localmente

Requisito: Python instalado (usado só para servir os arquivos).

1. Na pasta do projeto, rode: `py -m http.server 8000`
2. Abra no navegador: `http://localhost:8000`

Também é possível abrir o arquivo `index.html` direto no navegador, mas servir pela porta local se comporta melhor e é o que se aproxima do endereço publicado.

## Como testar

Há dois tipos de teste:

- **Automatizado (jsdom):** simula o navegador e cobre cadastro, funil, busca, recarregamento e conteúdo do CSV. Requisito: Node.js.
  1. `npm install`
  2. `npm test`
- **Manual:** o roteiro do arquivo [`TESTES.md`](TESTES.md) cobre o que a simulação não vê, como layout, tela de celular e abertura do CSV em planilha.

## Decisões de projeto

- **Arquivo único, JavaScript puro, sem framework e sem etapa de build.** O sistema inteiro está em `index.html`. A escolha priorizou a facilidade de manutenção por uma pessoa só, e não a elegância técnica.
- **Dados no navegador, sem servidor e sem login.** Simples e gratuito, e suficiente enquanto houver uma única pessoa usando em um único aparelho.
- **Testes automatizados desde o início**, em conjunto com o roteiro manual.
- **Publicação gratuita** no GitHub Pages.

## Limitações conhecidas

- Os dados ficam apenas no aparelho e no navegador usados. Limpar os dados do navegador ou trocar de celular faz perder tudo; a proteção é o backup por CSV.
- O Safari do iPhone pode apagar os dados de sites que ficam muitos dias sem ser abertos.
- Ainda não existe importação de CSV: o arquivo exportado serve para guardar e consultar, não para restaurar automaticamente.
- Não há cadastro de produtos (o perfume é texto livre), controle de estoque, parcelamento nem cálculo de lucro.
- Os requisitos ainda não foram confirmados em conversa com o usuário final; parte das regras é suposição e pode mudar.

## Estado do projeto

Em desenvolvimento, em blocos curtos. O código e os testes automatizados estão prontos. Faltam a confirmação do roteiro manual em um celular de verdade, a publicação, a entrega ao usuário final e o ajuste de campos conforme uma semana de uso real.

Projeto feito por um estudante de Inteligência Artificial, como prática de programação e portfólio.
