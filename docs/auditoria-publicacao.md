# Auditoria do que ficará público no repositório

Data: 30/09/2026 (tarefa T15). Contexto: a T14 decidiu repositório público `crm-perfumaria` no GitHub Pages (opção A). Em repositório público, qualquer pessoa pode ler tudo o que for enviado, inclusive o histórico de commits. Nada foi alterado, removido, configurado ou enviado nesta auditoria.

## Arquivos versionados

O que já está no Git (30 arquivos no `git ls-files`, 21 commits, nenhum remoto configurado):

| Grupo | Arquivos |
|---|---|
| Aplicação | `index.html`, `teste.js`, `package.json`, `package-lock.json` |
| Testes e contexto | `TESTES.md`, `CLAUDE.md`, `.gitignore` |
| Documentação | `docs/INDICE.md`, `docs/SEMANA.md`, `docs/pesquisa-armazenamento.md`, `docs/roteiro-entrevista.md` |
| Sistema de agentes | `.claude/agents/` (6), `.claude/commands/funcionalidade.md`, `.claude/skills/` (2), `.claude/hooks/` (4 scripts `.ps1`), `.claude/settings.json` |
| Planejamento | `.plano/OBJETIVO.md`, `.plano/PENDENCIAS.md`, `.plano/tarefas/_MODELO.md`, `.plano/estado/.gitkeep`, `.plano/historico/.gitkeep` |

Ainda **não versionados, mas entrariam no próximo commit** se alguém rodar `git add .`: `.plano/PLANO.md`, `.plano/ESTADO.md`, `.plano/CRONOGRAMA.md` e as tarefas `.plano/tarefas/T01` a `T28`. Também entraria a alteração pendente em `.plano/OBJETIVO.md`. Esses arquivos foram incluídos na busca de segredos abaixo.

Não serão enviados:

- `node_modules/` e `.DS_Store`: estão no `.gitignore`.
- `.plano/estado/*` (exceto `.gitkeep`): está no `.gitignore`. Contém `AMBIENTE.md`, gerado por script.
- `.claude - Copia/` e `CLAUDE - Copia.md`: **não existem** na pasta do projeto hoje (conferido com `ls`), portanto não há o que enviar. Se reaparecerem, como não estão no `.gitignore`, apareceriam como não rastreados e entrariam num `git add .`. Sugestão: só usar `git add` com nomes de arquivos, ou acrescentar `*Copia*` ao `.gitignore` (não feito aqui).
- Dados reais do CRM: ficam no `localStorage` do navegador, nunca em arquivo do repositório.

## Achados

Buscas feitas em todos os arquivos versionados e nos novos de `.plano/` e `docs/`: senha, password, token, secret, api key, e-mails (`@gmail`, `@hotmail`, `@outlook`, `@yahoo`), telefones, CPF, caminhos da máquina (`C:\Users`, `rodri`).

| # | Onde | Tipo | Gravidade | Detalhe |
|---|---|---|---|---|
| 1 | **Metadados de todos os 21 commits** | **E-mail pessoal do autor** | **Média (a mais importante)** | Autor e committer: `Rodrigo <e-mail pessoal do Gmail (omitido)>` (o e-mail completo é o que está em `git config user.email`, local e global). Só aparece nos metadados dos commits, não no conteúdo dos arquivos (`git log -S"@gmail"` não achou nada). Qualquer pessoa que clone o repositório público consegue ler com `git log`; o GitHub também o mostra em certas telas. |
| 2 | `git config user.name` | Nome | Baixa | Apenas o primeiro nome, "Rodrigo". Sem sobrenome. |
| 3 | `TESTES.md` linhas 64 e 66; `.plano/tarefas/T04` linha 34 | IP de rede local | Baixa | `192.168.0.x` (endereço privado de Wi-Fi doméstico). Não é acessível pela internet; revela pouco. |
| 4 | `index.html` linha 492 (placeholder); `teste.js` linha 70 | Telefone | Baixa | `61 90000-0000` e `61 97777-6666` são números de exemplo, inventados. Não há telefone real em nenhum arquivo. |
| 5 | `CLAUDE.md`, `.plano/OBJETIVO.md`, `docs/` | Informação sobre o amigo | Baixa | Descrevem o usuário final só como "perfumista autônomo", sem nome, telefone ou site. Mencionam que ele ainda não foi entrevistado e que existem suposições sobre o negócio dele. Nada que o identifique. Conferir com ele, por cortesia, se aceita ser citado como "amigo perfumista". |
| 6 | `CLAUDE.md` seção 1 e 2 | Dados pessoais do desenvolvedor | Baixa | Informa que é estudante de IA, iniciante, projeto feito em casa. É o tipo de texto que se escreve de propósito em portfólio; decisão sua se quer manter. |
| 7 | `.claude/settings.json`, `.claude/hooks/*.ps1` | Configuração local | Baixa | Sem credenciais. Usam `${CLAUDE_PROJECT_DIR}` e caminhos relativos. Não há caminho absoluto com seu usuário do Windows. |
| 8 | Palavras "senha", "token" etc. | Falso positivo | Nenhuma | Todas as ocorrências são texto como "não insira senhas", "gastar tokens" (limite de uso do Claude), "desenhar" (contém "senha"). Nenhum segredo real. |
| 9 | CPF, e-mail dentro de arquivos, chaves de API | Nenhum | Nenhuma | Nada encontrado. |
| 10 | Futuro: `docs/respostas-entrevista.md` (T13) e retorno da semana (T26) | Risco futuro | A reavaliar | Vão conter respostas reais do amigo (possivelmente preços, clientes, endereço do site). Antes de enviar, revisar; se for o caso, não versionar esses arquivos ou anonimizar. |

### Como evitar o e-mail pessoal em repositório público (achado 1)

Analogia: o e-mail do autor é como o remetente escrito no verso de cada carta (commit). Para não expor o endereço real, usa-se um endereço "de fachada" que o GitHub encaminha para você: o e-mail `noreply`.

Passos (a fazer por você; nenhum foi executado):

1. No GitHub, em **Settings > Emails**: marcar **Keep my email addresses private**. Nessa mesma página o GitHub mostra o seu endereço noreply, no formato `NUMERO+SEU-USUARIO@users.noreply.github.com` (o número e o usuário só existem depois da conta; o usuário será registrado na T17). Opcionalmente marcar também **Block command line pushes that expose my email**: assim o GitHub recusa qualquer envio que ainda carregue o e-mail real, o que funciona como rede de segurança.
2. No computador, configurar o Git para usar esse endereço nos próximos commits, só neste projeto: `git config user.email "NUMERO+SEU-USUARIO@users.noreply.github.com"` (sem `--global`, para não mexer em outros projetos; pode-se usar `--global` depois, se preferir).
3. **Isso não muda os 21 commits que já existem**: eles continuam com o e-mail real. Se for enviado o histórico atual, o e-mail real ficará público. Duas saídas, a decidir antes da T18:
   - **(a) Recomeçar o histórico limpo antes do primeiro envio.** Como ainda não há remoto, é o momento mais barato: reescrever a autoria dos commits existentes (com `git filter-repo --mailmap` ou, de forma mais simples para iniciante, criar um histórico novo a partir do estado atual com um único commit inicial, guardando a pasta `.git` antiga como backup). Perde-se o detalhe dos 21 commits, mas não o código.
   - **(b) Aceitar o e-mail nos commits antigos.** Só faz sentido se você não se importa que ele seja público (o endereço vira alvo de spam). Não recomendado.
   Observação: reescrever a autoria troca os identificadores (hashes) dos commits; por isso deve ser feito antes de qualquer envio, nunca depois.
4. Conferir depois do primeiro envio: `git log --format="%an <%ae>"` deve mostrar só o endereço noreply.

## Cenários

| # | Cenário | Prós | Contras |
|---|---|---|---|
| 1 | Repositório público com tudo (código, `CLAUDE.md`, `.plano/`, `.claude/`, `docs/`) | Mostra o método de trabalho completo no portfólio; não exige mexer em `.gitignore` nem desversionar nada; nenhum achado é grave. | Expõe todo o processo, inclusive rascunhos e suposições sobre o negócio do amigo; o arquivo de respostas da entrevista (T13) teria de ser revisado antes; o e-mail dos commits precisa ser tratado de qualquer forma. |
| 2 | Público sem `.plano/` e `.claude/` (colocados no `.gitignore`) | Mostra o produto e a documentação, escondendo o maquinário dos agentes e o planejamento. | Como os arquivos já estão versionados, o `.gitignore` sozinho não basta: seria preciso `git rm --cached` e, para sumirem do histórico, reescrevê-lo; sem isso continuam visíveis nos commits antigos. Risco de erro para iniciante; o `CLAUDE.md` referencia essas pastas. |
| 3 | Publicar só `index.html`, `README.md` e `TESTES.md` | Superfície mínima: menos risco e nada a revisar; é tudo de que o GitHub Pages precisa. | Perde valor de portfólio (sem `teste.js`, `package.json`, documentação, método); exige um repositório separado, ou seja, manter duas cópias; o `npm test` deixa de funcionar nesse repositório. |

## Recomendação

**Cenário 1, com duas condições**:

1. Tratar o e-mail antes do primeiro envio (passos acima): ativar o e-mail privado/noreply no GitHub e recomeçar o histórico limpo (opção 3a) enquanto ainda não há remoto.
2. Revisar `docs/respostas-entrevista.md` e `docs/retorno-semana.md` quando existirem; se contiverem dados reais do amigo (nomes de clientes, preços, site), não versioná-los ou anonimizá-los.

Motivo: os achados atuais são todos de gravidade baixa, exceto o e-mail (que tem solução simples e barata agora). O cenário 2 complica o Git para iniciante sem ganho de segurança real, e o cenário 3 joga fora o valor de portfólio. Reavaliar se, na entrevista, o amigo pedir sigilo sobre o negócio dele: nesse caso, o cenário 3 passa a ser o mais seguro.

Antes do envio (T18) rodar de novo, como conferência final: `git ls-files`, a busca de padrões sensíveis e `git log --format="%an <%ae>" | sort -u`.
