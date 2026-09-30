# T20 — AGUARDA USUÁRIO: apontar um subdomínio do site do amigo (condicional)

**Fase:** 5 — Publicação
**Porte:** M
**Depende de:** T19
**Executor:** AGUARDA USUÁRIO (depende de acesso ao painel de domínio do amigo)

## Contexto mínimo
Tarefa só se aplica se a T14 escolheu a opção B (subdomínio do site do perfumista apontando para o GitHub Pages). Se a opção foi A, marque CONCLUIDA com a nota "não se aplica". Um subdomínio é um endereço filho do site (por exemplo `controle.site-dele.com.br`); apontar é criar um registro no painel do domínio que diz "esse endereço é servido pelo GitHub".

## Arquivos para ler
- Resultado da T14
- Documentação oficial do GitHub sobre domínio personalizado no Pages (o executor consulta com WebSearch/WebFetch: "Managing a custom domain for your GitHub Pages site")

## O que fazer
1. (Executor) Antes de o desenvolvedor mexer no domínio, gerar um passo a passo específico, verificado na documentação atual do GitHub, com: o registro `CNAME` a criar no painel do domínio (nome do subdomínio apontando para `USUARIO.github.io`), o campo "Custom domain" em Settings > Pages e a opção "Enforce HTTPS".
2. (Desenvolvedor, com quem administra o site) Criar o registro no painel do domínio e preencher o domínio no GitHub Pages. Aguardar a propagação (minutos a horas).
3. (Executor) Verificar `curl -s -o /dev/null -w "%{http_code}" https://SUBDOMINIO` (esperado 200) e atualizar o `README.md` e o Resultado com o endereço final.

## Arquivos a criar ou alterar
- `README.md`; o GitHub cria automaticamente um arquivo `CNAME` no repositório

## Critério de pronto (verificável)
- [ ] `curl` do subdomínio devolve 200 com HTTPS e o texto "Perfumaria".
- [ ] O endereço final está no Resultado.

## Cuidados
- Não pedir senhas do painel de domínio; o desenvolvedor ou o administrador do site executa os passos.
- A partir daqui, o endereço deste subdomínio é o único válido para o amigo: dados salvos no endereço `github.io` anterior NÃO migram (não há importação de CSV). Reteste no novo endereço (T21).

## Resultado
(preenchido pelo executor / orquestrador)
