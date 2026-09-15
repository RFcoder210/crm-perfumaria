# CRM Perfumaria

Arquivo de contexto do projeto. Leia por completo antes de qualquer alteração.

---

## 1. O que é e para quem

Sistema de controle de vendas de perfumes, com duas frentes:

- **Leads** — pessoas que demonstraram interesse e ainda não compraram, acompanhadas por um funil de seis etapas.
- **Clientes e vendas** — histórico do que cada pessoa comprou, quando e por quanto.

**Usuário final:** um vendedor autônomo de perfumes, que não é da área de tecnologia. Vai usar principalmente pelo celular, entre atendimentos. Ele não é o desenvolvedor do projeto.

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

---

## 3. Estado atual do código

- `index.html` — aplicação inteira em um único arquivo: HTML, CSS e JavaScript puro (sem framework, sem etapa de build).
- Interface em português, pensada para celular.
- O código foi gerado em uma conversa no Claude.ai e ainda não passou por nenhum teste.

### Pendência crítica antes de qualquer outra coisa

O arquivo usa `window.storage` para salvar os dados. **Essa API só existe dentro dos artefatos do Claude.ai e não funciona em um navegador comum.** A primeira tarefa do projeto é substituí-la por `localStorage`, mantendo o mesmo formato de dados e o mesmo tratamento de erro. Sem isso, o sistema abre mas não salva nada.

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

- Arquivo único, JavaScript puro, sem framework e sem etapa de build. O motivo é a minha capacidade de manutenção, não elegância técnica.
- Dados no navegador do usuário final, sem servidor e sem conta de login.
- Publicação no GitHub Pages, gratuita.
- Backup pelo botão de exportar CSV, com rotina semanal recomendada ao usuário.
- Nada de otimização de desempenho antes de medir. Com algumas centenas de registros o sistema não fica lento. O ponto conhecido é que cada clique redesenha a tela inteira; só vale reescrever isso se um teste com 1.000 registros acusar lentidão perceptível.

---

## 7. Riscos assumidos

- **Perda de dados:** se o usuário limpar o navegador ou trocar de celular, perde tudo. Mitigação atual é o CSV. Migrar para um banco de dados online é assunto de uma fase futura, não de agora.
- **Requisitos incompletos:** o sistema foi desenhado sem entrevistar o usuário final. Campos como preço de custo, tamanho do frasco ou decant, forma de pagamento e prazo de recompra ainda não foram confirmados com ele.

---

## 8. Ordem de trabalho

1. Trocar `window.storage` por `localStorage` e confirmar que os dados sobrevivem ao recarregar a página.
2. Criar `TESTES.md` com o roteiro de testes manuais.
3. Iniciar o repositório Git e publicar no GitHub Pages.
4. Entregar ao usuário final e coletar retorno de uma semana de uso real.
5. Só então: testes automatizados com Playwright, seguindo o roteiro de `TESTES.md`.
6. Ajustes de campos conforme o retorno do uso real.

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
