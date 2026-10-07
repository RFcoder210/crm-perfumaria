# Retomada — 2026-10-06 21:06
Motivo do checkpoint: encerramento do dia (Dia 5, 06/10; dia curto a pedido do desenvolvedor)

## Onde paramos
- Última tarefa concluída: T29 (22 de 29 tarefas)
- Tarefa em andamento: nenhuma
- Arquivos alterados sem commit: `.plano/CRONOGRAMA.md`, `.plano/DIARIO.md`, `.plano/ESTADO.md`, `.plano/PENDENCIAS.md`, `docs/entrevista-site.md`

## Próxima ação (Dia 6, nesta ordem)
1. **iPhone (07/10):** passo 4 do guia (compartilhamento) + 3 itens do aviso de backup. Preparar checklist de verificação hoje.
2. **Corrigir CSV vazio:** com dados bloqueados, "Exportar CSV" gera arquivo vazio e marca como feito (falsa segurança). Usar `/novo-teste` e pequeno commit.
3. **Entrevista T12:** segunda tentativa de agendamento. T13 e T24 desembaraçadas dela.
4. **Texto de CLAUDE.md:** seção 3 desatualizada (bloqueio agora cobre navegador sem armazenamento E leitura que falha). Propor antes de editar.

## Pendências abertas
- T12 (U): entrevista não realizada 05/10; segue como PENDENTE. Desbloqueia T13, T24, T25, T26, T27, T28.
- T24 (U): entrega. Aguarda T22, T23 e resultado de T12 e T29.
- T25 (U): acompanhar semana de uso. Bloqueada por T24.
- **CSV vazio com bloqueado:** `index.html:508-511`, `885-906`. Gera arquivo vazio e marca backup como feito.
- **Domínio gbparfum.com:** acesso perdido (senha do Nicolas inválida). Falta saber registro e validade. Define endereço definitivo do CRM.
- **4 achados novos** (revisor-dados pós-T29-B): lead sem `etapas`, lista com tipo errado, data vazia e "Apagar tudo" com bloqueado. Registrados em `.plano/PENDENCIAS.md`, linhas 21-25.

## Decisões tomadas (Dia 5)
- **T29 item B (opção ii):** falha só de leitura agora marca `bloqueado`, recusa cadastro e mensagem diz "não dá para cadastrar". Commits `09e006e` e `6b09f36`, +5 verificações no `teste.js` (totalizando 73 passando).
- **Site:** não reaproveitar antigo; novo do zero. Vitrine depois loja. Aguarda acesso ao domínio registrado.

## Aguardando o usuário
- **T12:** agendamento efetivo da entrevista (segunda tentativa).
- **Verificações 07/10:** compartilhamento e aviso de backup no iPhone.
- **Domínio:** acesso ao registro e informações de validade do gbparfum.com.

## Estado técnico
- npm test: 78 testes passando (73 + 5 da T29, item B) (dados ilegíveis com JSON errado e leitura que falha).
- TESTES.md: 31/31 em iPhone (30/09).
- GitHub Pages: ativo; publica até commit `1bfdc4d` (sem push de 05/06/10).
- Hooks e agentes: ativados (testar-ao-parar, proteger-estado, /checar-pronto, /novo-teste, revisor-celular, revisor-dados).

## Ler se necessário (não ler por padrão)
- `.plano/tarefas/T29-leitura-invalida-do-armazenamento.md` (fechada; só referência)
- `.plano/PENDENCIAS.md` linhas 21-25 (4 achados novos pós-T29-B)
- `docs/entrevista-site.md` (respostas do Giordano; falta pergunta 3 dele e acesso ao domínio)
- `.plano/ESTADO.md` linha 68 (T29 CONCLUIDA) e linhas 51-68 (tarefas bloqueadas por T12 e T24)

## Consumo no momento do checkpoint
- Medidor de uso não ativado nesta sessão
