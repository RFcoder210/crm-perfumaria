# Pesquisa: armazenamento de dados no navegador e risco de perda

Consulta realizada em 30/09/2026. Todas as fontes abaixo foram abertas nesta data; as datas entre parênteses são as de publicação ou atualização informadas pela própria página (quando existem).

## Resumo

1. O Safari (iPhone e Mac) apaga dados gravados por scripts (inclui `localStorage`) de sites que o usuário não tocou durante 7 dias de uso do navegador. É a regra do ITP (Intelligent Tracking Prevention, o "sistema antirrastreamento" do Safari).
2. Um site adicionado à Tela de Início (web app) é isento dessa regra, segundo a WebKit. É a proteção mais forte disponível sem código.
3. `navigator.storage.persist()` existe em Safari e Chrome, mas o navegador decide sozinho, sem perguntar ao usuário; não é garantia.
4. No Chrome para Android a perda automática é rara (só com pouco espaço no aparelho); o risco maior é o usuário limpar os dados manualmente.
5. No `github.io`, todos os projetos do mesmo usuário compartilham o mesmo `localStorage`: o risco é um projeto sobrescrever os dados do outro. O backup por CSV continua sendo a única proteção real contra perda.

Analogia geral: o `localStorage` é uma gaveta no celular. O Safari tem uma faxina automática que joga fora gavetas de sites que ninguém abriu há uma semana; o Android só faz faxina quando falta espaço.

## Respostas

### a) Regra atual do Safari (iOS e macOS)

A regra do ITP: "ITP deletes all cookies created in JavaScript and all other script-writable storage after 7 days of no user interaction with the website." O que é apagado inclui IndexedDB, LocalStorage, SessionStorage, chaves de mídia e cache/registro de Service Worker.

Pontos importantes:
- Os "7 dias" contam dias de **uso do navegador**, não dias do calendário. A MDN descreve: se o site não teve interação (clique ou toque) "in the last seven days of browser use", os dados criados por script são apagados. Se o usuário ficar duas semanas sem abrir o Safari, o relógio não corre nesse período.
- A MDN informa que a remoção ocorre "when cross-site tracking prevention is turned on" (ligado por padrão).
- Cookies definidos pelo servidor ficam fora dessa remoção (irrelevante aqui: o sistema não usa servidor).
- A regra foi anunciada em 24/03/2020 (Safari 13.1) e continua descrita na página de política vigente da WebKit. Não encontrei fonte oficial que a tenha revogado.

Fontes:
- WebKit, "Tracking Prevention" (política vigente, sem data na página): https://webkit.org/tracking-prevention/ (consultado em 30/09/2026)
- WebKit, "Full Third-Party Cookie Blocking and More" (24/03/2020): https://webkit.org/blog/10218/full-third-party-cookie-blocking-and-more/ (consultado em 30/09/2026)
- MDN, "Storage quotas and eviction criteria": https://developer.mozilla.org/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria (consultado em 30/09/2026)

### b) Site na Tela de Início está isento?

Sim, segundo a WebKit. A página de política diz que o domínio de primeira parte de web apps da Tela de Início é isento do limite de 7 dias para todo armazenamento gravado por script. O post de 2020 explica o motivo: esses web apps têm "seu próprio contador de dias de uso", separado do Safari, que reinicia quando o app é aberto; a WebKit escreve que não espera que os dados do site nesse tipo de web app sejam apagados e pede que exclusões inesperadas sejam reportadas como defeito.

Cuidados:
- A isenção vale para o site aberto **pelo ícone** da Tela de Início. Um web app tem armazenamento separado do Safari: os dados cadastrados na aba do Safari **não** aparecem no ícone (e vice-versa). Quem for usar assim deve adicionar o ícone **antes** de cadastrar dados reais, ou exportar o CSV antes (hoje não há importação). Esta separação é uma observação de comportamento conhecido do iOS, não confirmada em fonte oficial consultada nesta pesquisa; deve ser verificada no aparelho.
- Isso vale para iPhone. No Android não há essa regra de 7 dias.
- A isenção não protege contra o usuário limpar os dados manualmente nem contra falta de espaço.

Fontes:
- https://webkit.org/tracking-prevention/ (consultado em 30/09/2026)
- https://webkit.org/blog/10218/full-third-party-cookie-blocking-and-more/ (24/03/2020; consultado em 30/09/2026)
- WebKit, "Updates to Storage Policy" (10/08/2023): https://webkit.org/blog/14403/updates-to-storage-policy/ (consultado em 30/09/2026). Observação: este post afirma que web apps da Tela de Início recebem as mesmas cotas de espaço que o navegador; trata de tamanho, não de prazo de 7 dias, então não contradiz as fontes acima.

### c) `navigator.storage.persist()`: funciona em Safari e Chrome Android? O que garante?

- **Existe** nos dois: a base de compatibilidade da MDN indica Chrome desde a versão 55 (Chrome Android acompanha) e Safari desde a 15.2 (Safari iOS acompanha). Exige HTTPS (o GitHub Pages atende).
- **O que promete:** se a resposta for `true`, o armazenamento fica em modo persistente e "não será limpo, exceto por ação explícita do usuário"; se `false`, pode ser limpo em caso de falta de espaço (MDN).
- **Quem decide:** a MDN informa que Safari e navegadores Chromium aprovam ou negam automaticamente, com base no histórico de interação do usuário com o site, e não mostram pergunta alguma. O web.dev detalha para o Chrome os critérios: engajamento com o site, site instalado ou favoritado, e permissão de notificações.
- **No Safari 17 em diante:** a WebKit descreve `persist()` como o modo que protege a origem da remoção por falta de espaço ("least-recently-used"). Não encontrei fonte oficial dizendo que `persist()` desativa o limite de 7 dias do ITP. Portanto, **não se deve contar com isso**.
- Analogia: é pedir ao porteiro que não jogue sua gaveta fora; ele decide sozinho, olhando se você frequenta o prédio.
- Lacuna: não testei em aparelho real o que `persist()` retorna no iPhone ou no Android com este site. Pode ser verificado com uma linha no console.

Fontes:
- MDN, `StorageManager.persist()`: https://developer.mozilla.org/en-US/docs/Web/API/StorageManager/persist (consultado em 30/09/2026)
- MDN, "Storage quotas and eviction criteria": https://developer.mozilla.org/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria (consultado em 30/09/2026)
- web.dev, "Persistent storage" (atualizado em 12/05/2020): https://web.dev/articles/persistent-storage (consultado em 30/09/2026)
- MDN browser-compat-data (versões): https://raw.githubusercontent.com/mdn/browser-compat-data/main/api/StorageManager.json (consultado em 30/09/2026)
- WebKit (10/08/2023): https://webkit.org/blog/14403/updates-to-storage-policy/ (consultado em 30/09/2026)

Contradição entre fontes: o caniuse (https://caniuse.com/mdn-api_storagemanager_persist, consultado em 30/09/2026) retornou, na leitura automática, números de versão do Chrome Android que não batem com a MDN (que espelha o Chrome 55). Não escolhi entre elas: a informação "existe no Chrome Android" está na MDN; a versão exata não importa para este projeto.

### d) Chrome no Android

- Não existe no Chrome uma regra de "apagar após X dias sem uso" como a do Safari. A fonte consultada descreve apenas a remoção por falta de espaço ("storage pressure"): quando o aparelho está com pouco espaço, o navegador apaga primeiro os dados do site usado há mais tempo (política LRU, "menos recentemente usado").
- O web.dev diz que, segundo pesquisa da equipe do Chrome, os dados raramente são apagados automaticamente; é bem mais comum o próprio usuário limpar. Ao limpar histórico/dados do navegador, o `localStorage` some.
- Sem `persist()` concedido, o dado é "best-effort" (faz o possível, sem garantia). Com `persist()` concedido, o Chrome não remove por falta de espaço.
- Sobre "modo economia de dados" do Chrome: não encontrei fonte oficial que relacione esse modo à exclusão de dados de sites. Não afirmo nem nego. Limpadores de celular de terceiros ("limpar cache", "otimizador") podem apagar dados do navegador; isso é um risco prático, não documentado nas fontes oficiais consultadas.
- Observação: os textos oficiais do Chrome citam IndexedDB e Cache API como exemplos; o artigo de 2022 do Chrome afirma, em termos gerais, que dados de "IndexedDB ou `localStorage`" se perdem quando acaba o espaço. As fontes divergem em detalhe sobre o `localStorage` especificamente, então o risco é tratado como existente, porém baixo.

Fontes:
- web.dev, "Persistent storage" (12/05/2020): https://web.dev/articles/persistent-storage (consultado em 30/09/2026)
- Chrome for Developers, "Storage Buckets" (04/11/2022): https://developer.chrome.com/docs/web-platform/storage-buckets (consultado em 30/09/2026)
- MDN, "Storage quotas and eviction criteria": https://developer.mozilla.org/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria (consultado em 30/09/2026)

### e) `localStorage` no `github.io` é compartilhado com outros projetos do mesmo usuário?

Sim. O navegador define a "origem" pela combinação protocolo + host + porta; o caminho (a parte depois da barra) **não** faz parte da origem. Logo `https://usuario.github.io/crm-perfumaria/` e `https://usuario.github.io/outro-projeto/` são a mesma origem e enxergam o mesmo `localStorage`. A MDN afirma explicitamente que as cotas e regras de remoção valem para a origem inteira, mesmo que ela hospede vários sites em caminhos diferentes. Já `usuario.github.io` e `outro.github.io` são origens distintas (o `github.io` consta na Public Suffix List, a lista que separa sites independentes), então o vazamento é só entre projetos **do mesmo usuário**.

Riscos:
- Outro projeto do mesmo usuário GitHub pode ler, sobrescrever ou apagar a chave `crm-perfumes:dados`. A chave já tem prefixo próprio, o que reduz colisões acidentais, mas não impede um código malicioso ou um `localStorage.clear()` de outro projeto.
- Se a conta GitHub for a do desenvolvedor (projetos de estudo/portfólio na mesma conta), qualquer experimento hospedado ali pode mexer nos dados dos clientes do perfumista. Isso reforça a preocupação do `CLAUDE.md` (seção 7.3, pergunta 6) sobre o endereço definitivo: um subdomínio próprio isolaria os dados.
- Quota e remoção são por origem: se outro projeto consumir espaço, afeta todos.
- Mitigações sem custo: manter o prefixo da chave (já existe); não hospedar outros projetos com `localStorage.clear()` ou chaves genéricas nessa conta; ou usar uma conta/organização separada para o CRM.

Fontes:
- MDN, Same-origin policy: https://developer.mozilla.org/en-US/docs/Web/Security/Defenses/Same-origin_policy (consultado em 30/09/2026)
- MDN, "Storage quotas and eviction criteria" (trecho sobre origem que hospeda vários sites): https://developer.mozilla.org/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria (consultado em 30/09/2026)
- GitHub Docs, formato de URL (`<dono>.github.io/<repositório>`): https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages (consultado em 30/09/2026)
- Demonstração prática de compartilhamento de `localStorage` entre repositórios da mesma conta (fonte da comunidade, não oficial): https://github.com/TomasHubelbauer/github-pages-local-storage (consultado em 30/09/2026)

## Opções de proteção

| # | Opção | Custo de implementação | Eficácia |
|---|-------|------------------------|----------|
| 1 | Instruir o perfumista a adicionar o site à Tela de Início (iPhone) e abrir sempre pelo ícone | Nenhum código; só orientação (entra no guia do usuário, T22). Precisa ser feito antes de cadastrar dados reais, pois o ícone tem armazenamento próprio (verificar no aparelho) | Alta contra a regra de 7 dias do Safari, segundo a WebKit. Não protege contra limpeza manual. Irrelevante no Android |
| 2 | Pedir `navigator.storage.persist()` ao abrir o sistema | Poucas linhas em `index.html` (chamar uma vez, sem interface). Exige HTTPS (GitHub Pages ok) | Incerta: o navegador decide sozinho e não há fonte oficial de que proteja contra o limite de 7 dias. Pode ajudar no Chrome Android contra limpeza por falta de espaço. Baixo custo, ganho provável pequeno |
| 3 | Aviso na tela quando a última exportação de CSV tem mais de 7 dias (guardar a data da exportação e comparar ao abrir) | Poucas linhas em `index.html` (nova chave de data; decisão de onde guardar, já que o aviso some se os dados forem apagados) | Média-alta como **lembrete** de backup: não impede a perda, mas limita o prejuízo a uma semana. Depende de o usuário de fato exportar |
| 4 | Botão de importar CSV, para restaurar o backup | Código novo e maior (ler arquivo, validar, mesclar). **Fora da ordem de trabalho atual**: apenas registrado | Alta como recuperação, porque hoje o CSV exporta mas não volta. Sem importação, o backup só serve para consulta, não para restaurar |

Nota sobre a opção 3: o CSV é a única proteção que independe do navegador. Sem a opção 4, porém, ele é um registro para leitura, não um backup restaurável. Isso merece ser dito ao desenvolvedor como risco residual.

## Recomendação

1. Adotar a opção 1 (Tela de Início, no iPhone) como orientação principal no guia do usuário, e confirmar com o perfumista qual celular ele usa antes de decidir o resto.
2. Implementar a opção 3 (aviso de exportação com mais de 7 dias); considerar a opção 2 por ser barata, sem tratá-la como garantia; manter a opção 4 registrada como ideia futura, lembrando que sem ela o backup não é restaurável.
3. Verificar no aparelho real (a) se o ícone da Tela de Início tem armazenamento separado do Safari e (b) o que `persist()` retorna, antes de prometer qualquer proteção ao usuário final; e evitar hospedar outros projetos na mesma conta GitHub que usem `localStorage`.
