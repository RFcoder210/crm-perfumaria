# CRM Perfumaria

Arquivo de contexto do projeto. Leia por completo antes de qualquer alteração.

---

## 1. O que é e para quem

Sistema de controle de vendas de perfumes, com duas frentes:

- **Leads** — pessoas que demonstraram interesse e ainda não compraram, acompanhadas por um funil de seis etapas.
- **Clientes e vendas** — histórico do que cada pessoa comprou, quando e por quanto.

**Usuário final:** um perfumista autônomo, que não é da área de tecnologia. Ele fabrica as próprias fragrâncias, tanto contratipos quanto autorais, e vende apenas frascos fechados. Não é revendedor de marcas de terceiros. Vai usar principalmente pelo celular, entre atendimentos. Ele não é o desenvolvedor do projeto.

**Desenvolvedor:** eu. Estudante de Inteligência Artificial, iniciante em programação, estudando Python em paralelo. Este projeto é para um amigo e serve também como portfólio e prática.

**Critério inegociável do projeto:** tudo precisa ser feito por mim, sozinho, em casa, com ferramentas gratuitas.

---

## 2. Como trabalhar comigo

- Responda sempre em português do Brasil.
- Sou iniciante em programação. Ao usar um conceito novo (função, array, evento, commit, deploy, teste unitário), explique em uma ou duas frases com analogia do mundo real antes de seguir.
- Seja objetivo e pragmático. Não proponha soluções fora do meu alcance atual, nem arquitetura maior do que o problema exige.
- Antes de editar arquivos, apresente um plano curto do que pretende mudar e aguarde minha confirmação.
- Faça uma alteração por vez, com commit pequeno e mensagem descritiva em português.
- Se eu pedir algo que vai criar problema mais adiante, diga isso antes de fazer.
- Quando um conceito importante aparecer, avise: "isso vale para o Caderno de Conceitos" — mantenho um material de estudo separado.
- O projeto avança aos poucos, em blocos curtos, porque estudo em paralelo.

---

## 3. Estado atual do código

- `index.html` — aplicação inteira em um único arquivo: HTML, CSS e JavaScript puro (sem framework, sem etapa de build). Interface em português, pensada para celular. Gerado em uma conversa no Claude.ai.
- `TESTES.md` — roteiro de testes manuais.
- `teste.js` — teste automatizado com jsdom, que cobre parte do roteiro. Roda com `npm test`.
- `package.json` — declara o jsdom como dependência de desenvolvimento.

### Armazenamento dos dados

A troca de `window.storage` por `localStorage` já foi feita. Os dados ficam na chave `crm-perfumes:dados`, no formato da seção 4. O código trata três situações de erro:

- navegador bloqueando o armazenamento: avisa que nada será salvo;
- dados salvos ilegíveis: avisa, não grava por cima e **recusa novos cadastros** (lead e venda), mantendo o aviso na tela, para permitir recuperação;
- falha ao gravar: avisa e recomenda exportar o CSV.

### Pendências

- **Confirmar em navegador real, no celular**, rodando o roteiro do `TESTES.md` pela primeira vez: os dados precisam sobreviver ao recarregar a página e ao fechar e reabrir o navegador. O `teste.js` simula o recarregamento, mas não substitui o teste no aparelho.
- O `teste.js` cria três páginas que nunca usa (`dom2`, `dom3`, `dom4`). Não afetam o resultado; ficam para uma limpeza futura.
- **Achados abertos da revisão de 01/10** (dados e celular): ver `.plano/PENDENCIAS.md`. A tarefa **T29** (`.plano/tarefas/`) trata das duas suspeitas de perda de dados e é recomendada antes da entrega.

---

## 4. Modelo de dados

Tudo é gravado em uma única chave, contendo um objeto com duas listas.

```js
{
  leads: [
    {
      id: "string",          // gerado automaticamente
      nome: "string",        // único campo obrigatório
      telefone: "string",    // vira link do WhatsApp
      perfume: "string",     // perfume de interesse
      familia: "string",     // id da família olfativa
      data: "AAAA-MM-DD",    // data do interesse
      obs: "string",
      etapas: {
        msg1: false,         // mandei mensagem
        msg2: false,         // mandei mensagem de novo
        encomenda: false,    // encomendou
        pago: false,         // pagou
        entregue: false,     // recebeu
        recompra: false      // recomprou
      },
      convertido: false      // true quando já virou registro de venda
    }
  ],
  vendas: [
    {
      id: "string",
      nome: "string",        // cliente
      perfume: "string",
      familia: "string",
      data: "AAAA-MM-DD",    // data da compra
      valor: "string",       // opcional
      obs: "string"
    }
  ]
}
```

**Famílias olfativas (ids fixos):** `floral`, `citrico`, `amadeirado`, `ambar`, `fougere`, `chipre`, `aquatico`, `gourmand`. Cada uma tem uma cor própria, usada na borda do cartão e nos marcadores do funil.

---

## 5. Regras de negócio

- As seis etapas do funil são independentes: dá para marcar e desmarcar em qualquer ordem, porque a vida real não segue o roteiro.
- O marcador tracejado indica a próxima etapa ainda não cumprida.
- Quando um lead chega em "recebeu", aparece o botão **Lançar em vendas**, que copia os dados para a lista de vendas e marca `convertido: true`. O botão some depois, para evitar lançamento duplicado.
- O lead **não** é apagado ao virar venda: o histórico de contato é informação útil.
- Os totais do topo consideram apenas o mês corrente.
- Exclusões sempre pedem confirmação.

---

## 6. Decisões já tomadas — não reabrir sem eu pedir

As decisões estão em três grupos. As técnicas dependem só de mim. As outras dependem do usuário final e ficam marcadas como CONFIRMADO ou SUPOSIÇÃO. Conforme ele responder, movo cada item de SUPOSIÇÃO para CONFIRMADO, ou reabro a decisão.

### 6.1 Decisões técnicas — dependem só de mim

- Arquivo único, JavaScript puro, sem framework e sem etapa de build. O motivo é a minha capacidade de manutenção, não elegância técnica.
- Publicação no GitHub Pages, gratuita.
- Testes automatizados com jsdom desde já, sem esperar a entrega (ver seção 8).
- Nada de otimização de desempenho antes de medir. Com algumas centenas de registros o sistema não fica lento. O ponto conhecido é que cada clique redesenha a tela inteira; só vale reescrever isso se um teste com 1.000 registros acusar lentidão perceptível.

### 6.2 CONFIRMADO pelo usuário final

- Nenhum item até agora.

### 6.3 SUPOSIÇÃO minha — ainda não confirmado com o usuário final

- Dados no navegador do usuário final, sem servidor e sem conta de login. Só se sustenta se ele for a única pessoa a usar o sistema (ver 7.3, pergunta 1).
- Backup pelo botão de exportar CSV, com rotina semanal recomendada. Pressupõe que ele vai exportar com regularidade.
- Interface pensada para celular, porque ele usaria principalmente pelo celular, entre atendimentos.

---

## 7. Riscos e requisitos em aberto

**A entrevista com o usuário final estava marcada e não aconteceu.** Nenhum requisito foi confirmado com ele até agora. O sistema continua desenhado a partir de suposições minhas.

### 7.1 Riscos assumidos

- **Perda de dados:** se o usuário limpar o navegador ou trocar de celular, perde tudo. A mitigação atual é o CSV. Migrar para um banco de dados online é assunto de uma fase futura, a menos que a resposta à pergunta 1 de 7.3 antecipe isso.
- **Limpeza automática do Safari (iPhone):** o Safari pode apagar os dados de um site depois de alguns dias de uso do navegador sem que o site seja aberto (a regra conhecida é de sete dias). Isso afeta diretamente um sistema que guarda tudo no navegador. Verificar a regra atual e como se proteger antes da entrega (seção 8, item 4).
- **Requisitos não confirmados:** enquanto a entrevista não acontecer, qualquer campo ou regra de negócio pode mudar.

### 7.2 CONFIRMADO pelo usuário final

- Nenhum item até agora.

### 7.3 SUPOSIÇÃO minha — perguntas para o usuário final

1. **Mais alguém além dele vai usar o sistema?** É a pergunta de maior impacto técnico, porque decide se os dados podem continuar no navegador. Hoje os dados ficam presos ao navegador de um único aparelho. Se outra pessoa precisar ver ou lançar vendas, a decisão de 6.3 sobre dados no navegador cai. Suposição atual: só ele usa, em um único aparelho.
2. **Cadastro de produtos.** O campo `perfume` hoje é texto livre. Como ele fabrica as próprias fragrâncias, provavelmente precisa virar um cadastro fixo de produtos. Registrado como risco; não implementar agora. Suposição atual: texto livre basta.
3. **Produz sob encomenda ou em lote?** Ainda não sabemos. Suposição atual: o sistema não trata produção nem estoque.
4. **Forma de pagamento: vende parcelado?** Ainda não sabemos. Hoje cada venda tem um único valor e a etapa "Pagou" é sim ou não; parcelamento não cabe nesse formato. Suposição atual: pagamento à vista.
5. **Outros campos a confirmar:** preço de custo, tamanho do frasco e prazo de recompra. Decant não se aplica: ele vende apenas frascos fechados.
6. **Ele já tem um site: integrar ou não?** Ainda não sabemos em que plataforma o site foi feito, quem o administra, nem se ele vende por ele (se for loja online, a plataforma pode já registrar clientes e pedidos, duplicando parte deste sistema). **O endereço definitivo precisa ser decidido antes da entrega:** os dados do navegador ficam presos ao endereço em que o sistema é aberto, e hoje não existe importação de CSV; trocar de endereço depois faz o sistema abrir vazio. Opções levantadas: manter o GitHub Pages; apontar um subdomínio do site dele para o GitHub Pages; ou colocar numa pasta do site, o que não é recomendado, porque os códigos do site teriam acesso aos dados dos clientes. Suposição atual: sem integração com o site.

---

## 8. Ordem de trabalho

1. Trocar `window.storage` por `localStorage`. **Feito no código; falta confirmar em navegador real, no celular** (ver seção 3).
2. Criar `TESTES.md` com o roteiro de testes manuais. **Feito.**
3. Iniciar o repositório Git e publicar no GitHub Pages. **Git iniciado; publicação pendente.**
4. Entregar ao usuário final e coletar retorno de uma semana de uso real.
5. Testes com Playwright, num navegador de verdade, seguindo o roteiro de `TESTES.md`, para o que o jsdom não cobre: layout e tela de celular.
6. Ajustes de campos conforme o retorno do uso real.

**Decisão registrada em 15/09/2026 — testes automatizados com jsdom desde já.** O plano original deixava todo teste automatizado para depois da entrega. Na prática, o `teste.js` com jsdom já existe, e a decisão é mantê-lo e usá-lo desde já, junto com o roteiro manual. O jsdom não vê layout, não simula celular e não abre o CSV, então não substitui o `TESTES.md` nem o Playwright.

Ideias fora dessa ordem (lembrete de recompra, cálculo de lucro, gráficos, controle de estoque) ficam registradas, não implementadas.

---

## 9. Definição de pronto

Uma alteração só está concluída quando:

- o roteiro de `TESTES.md` passa inteiro;
- funciona em tela de celular;
- os dados continuam íntegros após recarregar a página;
- o texto da interface está em português, em frases que o usuário final entenderia sem explicação;
- a mudança foi commitada com mensagem descritiva.

---

## 10. Roteiro de testes manuais (base para o TESTES.md)

- Cadastrar lead informando apenas o nome.
- Cadastrar com nome contendo acento e apóstrofo.
- Marcar e desmarcar etapas fora de ordem.
- Recarregar a página e conferir se todos os registros voltaram.
- Editar um lead e cancelar no meio da edição.
- Excluir um lead enquanto outro está em edição.
- Buscar por termo inexistente e conferir a mensagem de lista vazia.
- Clicar em "Lançar em vendas" e verificar que o botão desaparece.
- Exportar o CSV e abrir no Excel ou Google Sheets, conferindo acentuação.
- Abrir em tela de celular e confirmar que os marcadores do funil são clicáveis.

---

## Sistema de agentes

Este projeto usa um **sistema de agentes** organizado pela pasta `.plano/`.

- O ciclo de trabalho é conduzido pelo comando `/orquestrar`; o encerramento do dia, por `/encerrar-dia`.
- Memória durável do projeto: `.plano/` (OBJETIVO, PLANO, ESTADO, CRONOGRAMA, PENDENCIAS, RETOMADA, tarefas/). A conversa é descartável; o que importa é gravado nesses arquivos.
- Nome das sessões: toda sessão iniciada com `/orquestrar` é nomeada `Dia N · DD/MM · foco`, e o registro dos dias fica em `.plano/DIARIO.md`. Regra pedida pelo desenvolvedor para não se perder entre as sessões.
- Status válidos de tarefa: PENDENTE, EM_ANDAMENTO, CONCLUIDA, BLOQUEADA.
- `.plano/estado/` é gerado por scripts (medidor de uso). Não editar manualmente. O hook `proteger-estado.ps1` bloqueia a edição pelas ferramentas Edit e Write.
- Automações em `.claude/` (desde 01/10; passam a valer em sessão nova):
  - hook `testar-ao-parar.ps1`: ao fim de cada resposta, roda `npm test` se `index.html` ou `teste.js` mudaram; se falhar, devolve o erro para ser corrigido;
  - skills `/checar-pronto` (Definição de Pronto da seção 9, sem marcar itens manuais nem commitar sozinha) e `/novo-teste` (teste novo no padrão de `teste.js` mais linha em `TESTES.md`, provando que o teste falha quando o comportamento é quebrado);
  - agentes de só leitura `revisor-celular` (toque, rolagem, texto pequeno, linguagem) e `revisor-dados` (risco de perda de dados). Eles leem código: o que marcam como "indício" ou "suspeita" só se confirma no aparelho ou com teste.

### Ambiente
- Windows. A ferramenta Bash usa Git Bash; comandos PowerShell também são aceitos.
- Este projeto é HTML, CSS e JavaScript puros: não há ambiente virtual Python. O Node.js é usado apenas para o `npm test` (jsdom). Se um agente precisar de Python para alguma tarefa, usar o ambiente virtual do projeto (`.venv/Scripts/python`), criado com `py -m venv .venv`.
- Nunca apagar arquivos do usuário fora de `.plano/historico/`.

### Comunicação
- Português do Brasil, linguagem formal e objetiva.
- Em caso de conflito com a seção 2 deste arquivo (explicar conceitos novos com analogia, porque o desenvolvedor é iniciante), vale a seção 2.
- Relatórios de subagentes: curtos e no formato definido em cada agente.
