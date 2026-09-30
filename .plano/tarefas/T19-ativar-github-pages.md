# T19 — AGUARDA USUÁRIO: ativar o GitHub Pages e verificar o endereço

**Fase:** 5 — Publicação
**Porte:** P
**Depende de:** T18
**Executor:** o desenvolvedor ativa (AGUARDA USUÁRIO); depois o executor-tarefa verifica

## Contexto mínimo
O GitHub Pages serve o `index.html` do repositório como site. A ativação é feita no site do GitHub, com a conta do desenvolvedor. O endereço padrão será `https://USUARIO.github.io/NOME-DO-REPOSITORIO/`. Este é o endereço definitivo (opção A da T14) ou a base para o subdomínio (opção B, T20).

## Arquivos para ler
- Resultado da T14 e da T17 (nome do repositório e usuário)
- `README.md` (marcador `ENDERECO-A-PREENCHER-NA-T19`)

## O que fazer
1. (Desenvolvedor) No repositório, abrir Settings, depois Pages; em "Build and deployment", escolher Source "Deploy from a branch", Branch `main` e pasta `/ (root)`; salvar. Aguardar de 1 a 3 minutos e informar o endereço que o GitHub exibir.
2. (Executor) Verificar com `curl -s -o /dev/null -w "%{http_code}" URL` (esperado 200) e `curl -s URL | grep -c "Perfumaria"` (esperado maior que 0, pois o título da página é "Perfumaria — controle de vendas").
3. (Executor) Substituir o marcador `ENDERECO-A-PREENCHER-NA-T19` do `README.md` pelo endereço real. Registrar o endereço no Resultado.
4. Confirmar que a página usa o cabeçalho viewport (`grep -n viewport index.html`) e abre sem erro no navegador embutido, se disponível.

## Arquivos a criar ou alterar
- `README.md`

## Critério de pronto (verificável)
- [ ] `curl` do endereço publicado devolve 200 e o texto "Perfumaria".
- [ ] `grep -c "ENDERECO-A-PREENCHER" README.md` retorna 0.
- [ ] O endereço aparece por extenso no Resultado.

## Cuidados
- Se retornar 404, esperar alguns minutos e tentar de novo; após 2 tentativas, devolver PENDENTE com a resposta do servidor.
- O `README.md` alterado precisa de novo commit e novo envio: o executor apenas propõe; o envio só com nova confirmação explícita do desenvolvedor.

## Resultado
Concluída em 2026-09-30. O desenvolvedor ativou o Pages (Deploy from a branch, main, / (root)); a verificação foi feita pelo orquestrador.
- Endereço publicado: https://rfcoder210.github.io/crm-perfumaria/
- `curl`: HTTP 200, `Content-Type: text/html`, servido por GitHub.com; o texto "Perfumaria" aparece na página.
- O `index.html` publicado é idêntico ao local (mesmo hash Git) e o commit do remoto é igual ao local.
- No navegador embutido: abre em HTTPS, `localStorage` funciona, cadastro com apóstrofo e acento gravou, os dados sobreviveram a recarregar, e o aviso de backup apareceu ("Faz 20 dias...") com a data forçada. Dados de teste apagados depois. Único erro no console: 404 do `favicon.ico` (o sistema não tem ícone de aba; inofensivo).
- Atenção (cenário 1 da auditoria): o Pages publica TODOS os arquivos do repositório, não só o sistema. `CLAUDE.md` e `docs/auditoria-publicacao.md`, por exemplo, abrem em URL pública. É o esperado nesse cenário.
- README: o marcador foi trocado pelo endereço real. Alteração commitada localmente; o envio ao GitHub aguarda nova confirmação do desenvolvedor.
