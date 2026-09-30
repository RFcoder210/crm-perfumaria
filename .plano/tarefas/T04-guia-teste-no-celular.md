# T04 — Guia para abrir o sistema no celular (servidor local)

**Fase:** 1 — Base local
**Porte:** P
**Depende de:** T01
**Executor:** executor-tarefa

## Contexto mínimo
Para testar no celular antes de publicar, o computador serve o `index.html` na rede Wi-Fi da casa e o celular acessa pelo endereço do computador. Um servidor local é como abrir uma janelinha na sua casa para o celular espiar: só quem está no mesmo Wi-Fi enxerga. O desenvolvedor é iniciante; o guia deve ser passo a passo. Python 3.14 já está instalado (`py --version`).

## Arquivos para ler
- `TESTES.md` (para inserir o guia antes da seção "Celular")

## O que fazer
1. Verifique que o servidor sobe: rode em segundo plano `py -m http.server 8000 --bind 0.0.0.0` na raiz do projeto, confirme com `curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/index.html` (esperado 200) e encerre o servidor.
2. Descubra como obter o IP do computador na rede local (`ipconfig`, linha "Endereço IPv4" do adaptador Wi-Fi) e registre o comando.
3. Acrescente ao `TESTES.md`, antes da seção "## Celular", uma seção "## Como abrir no celular (teste antes de publicar)" com passos numerados: (a) computador e celular no mesmo Wi-Fi; (b) rodar o comando do servidor na pasta do projeto; (c) descobrir o IPv4 com `ipconfig`; (d) no celular, abrir `http://IPV4:8000/index.html`; (e) se não abrir, permitir o Python no Firewall do Windows (rede privada) quando o Windows perguntar; (f) ao terminar, parar o servidor com Ctrl+C. Explicar em uma frase que os dados salvos nesse endereço ficam separados dos do endereço publicado depois (cada endereço tem seu próprio "armário" de dados).
4. Incluir um aviso: este teste usa `http`, não `https`; o `localStorage` funciona, mas se algum recurso exigir https isso será conferido após a publicação (T21).

## Arquivos a criar ou alterar
- `TESTES.md`

## Critério de pronto (verificável)
- [ ] `grep -n "Como abrir no celular" TESTES.md` retorna a nova seção, antes de "## Celular".
- [ ] Seção Resultado registra o código HTTP 200 obtido no passo 1.

## Cuidados
- Não deixar o servidor rodando ao final (confirme que a porta 8000 está livre).
- Não expor nada além da pasta do projeto; o servidor só deve ser usado durante o teste. Não commitar: proponha mensagem (sugestão: "Acrescenta ao TESTES.md o passo a passo para abrir no celular").

## Resultado
CONCLUIDA.
- Passo 1: servidor `py -m http.server 8000 --bind 0.0.0.0` subiu; `curl` em http://localhost:8000/index.html retornou **HTTP 200**. Servidor encerrado; porta 8000 sem conexões (verificado).
- Passo 2: IPv4 obtido com `ipconfig` (linha "Endereço IPv4"); na máquina atual, 192.168.0.79.
- Passo 3/4: seção "## Como abrir no celular (teste antes de publicar)" inserida no `TESTES.md` (linha 51), antes de "## Celular" (linha 80), com os 6 passos, a explicação do "armário" de dados e o aviso http/https (T21).
- Arquivo alterado: `TESTES.md`. Não commitado. Mensagem sugerida: "Acrescenta ao TESTES.md o passo a passo para abrir no celular".
