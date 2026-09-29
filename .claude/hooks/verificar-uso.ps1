# ============================================================================
# verificar-uso.ps1 — "Sentinela" de consumo (hook)
# ----------------------------------------------------------------------------
# Quando roda:
#   - UserPromptSubmit : toda vez que você envia uma mensagem;
#   - PostToolUse (Agent|SendMessage): toda vez que o orquestrador aciona ou
#     retoma um subagente, ou seja, antes de cada nova etapa de trabalho.
#
# O que faz:
#   Lê o medidor .plano/estado/uso.json (gravado pela barra de status) e, se
#   algum limite passou do nível de alerta, entrega ao orquestrador um aviso
#   de contexto. Cada aviso é dado UMA vez por nível, para não repetir.
#
# Níveis (ajuste à vontade nas variáveis abaixo):
#   janela de 5 h  : 80% = checkpoint preventivo | 90% = encerrar o dia
#   janela semanal : 85% = reduzir o ritmo       | 95% = encerrar o dia
#   contexto       : 70% = checkpoint + compactar
# ============================================================================

# UTF-8 sem BOM: evita acentos quebrados e caracteres invisíveis na saída
$utf8SemBom = New-Object System.Text.UTF8Encoding $false
[Console]::InputEncoding  = $utf8SemBom
[Console]::OutputEncoding = $utf8SemBom

$ALERTA_5H      = 80
$CRITICO_5H     = 90
$ALERTA_SEMANA  = 85
$CRITICO_SEMANA = 95
$ALERTA_CTX     = 70
$REARME_CTX     = 45   # abaixo disto (ex.: após compactar) o alerta de contexto é rearmado
$VALIDADE_MIN   = 360  # medições com mais de 6 h são ignoradas

try { $entrada = [Console]::In.ReadToEnd() | ConvertFrom-Json } catch { exit 0 }

$evento = $entrada.hook_event_name
if (-not $evento) { exit 0 }

# Hooks disparados DENTRO de um subagente trazem agent_id; o aviso deve ir
# apenas para o orquestrador (sessão principal).
if ($entrada.agent_id) { exit 0 }

$raiz = $env:CLAUDE_PROJECT_DIR
if (-not $raiz) { $raiz = $entrada.cwd }
if (-not $raiz) { exit 0 }

$arqUso    = Join-Path $raiz '.plano/estado/uso.json'
$arqAlerta = Join-Path $raiz '.plano/estado/alertas.json'
if (-not (Test-Path $arqUso)) { exit 0 }

try { $uso = Get-Content -Raw -Encoding UTF8 $arqUso | ConvertFrom-Json } catch { exit 0 }

# Ignora medições antigas
try {
    $idade = ((Get-Date) - [datetime]$uso.atualizado_em).TotalMinutes
    if ($idade -gt $VALIDADE_MIN) { exit 0 }
} catch { exit 0 }

# Estado dos alertas já emitidos
$estado = [ordered]@{ janela5h = ''; niveis5h = @(); janelaSem = ''; niveisSem = @(); ctxAlertado = $false }
if (Test-Path $arqAlerta) {
    try {
        $lido = Get-Content -Raw -Encoding UTF8 $arqAlerta | ConvertFrom-Json
        $estado.janela5h    = [string]$lido.janela5h
        $estado.niveis5h    = @($lido.niveis5h | Where-Object { $_ })
        $estado.janelaSem   = [string]$lido.janelaSem
        $estado.niveisSem   = @($lido.niveisSem | Where-Object { $_ })
        $estado.ctxAlertado = [bool]$lido.ctxAlertado
    } catch { }
}

# Nova janela de uso = zera os alertas daquela janela
if ([string]$uso.janela_5h_renova_epoch -ne $estado.janela5h) {
    $estado.janela5h = [string]$uso.janela_5h_renova_epoch; $estado.niveis5h = @()
}
if ([string]$uso.semanal_renova_epoch -ne $estado.janelaSem) {
    $estado.janelaSem = [string]$uso.semanal_renova_epoch; $estado.niveisSem = @()
}

$avisos = @()

# --- Janela de 5 horas -------------------------------------------------------
if ($null -ne $uso.janela_5h_pct) {
    $p = [double]$uso.janela_5h_pct
    $renova = $uso.janela_5h_renova_hora
    if ($p -ge $CRITICO_5H -and ($estado.niveis5h -notcontains 'critico')) {
        $avisos += ("Medidor de uso do projeto: a janela de 5 horas está em {0:N0}% (renova às {1}). Nível CRÍTICO: pelo protocolo /orquestrar, a próxima ação é o encerramento do dia (/encerrar-dia), sem iniciar novas tarefas." -f $p, $renova)
        $estado.niveis5h = @($estado.niveis5h) + 'critico' + 'alerta'
    } elseif ($p -ge $ALERTA_5H -and ($estado.niveis5h -notcontains 'alerta')) {
        $avisos += ("Medidor de uso do projeto: a janela de 5 horas está em {0:N0}% (renova às {1}). Nível de ALERTA: pelo protocolo /orquestrar, cabe um checkpoint preventivo (agente contexto-tokens) antes da próxima tarefa, e apenas tarefas pequenas até a renovação." -f $p, $renova)
        $estado.niveis5h = @($estado.niveis5h) + 'alerta'
    }
}

# --- Janela semanal ----------------------------------------------------------
if ($null -ne $uso.semanal_pct) {
    $p = [double]$uso.semanal_pct
    $renova = $uso.semanal_renova_data
    if ($p -ge $CRITICO_SEMANA -and ($estado.niveisSem -notcontains 'critico')) {
        $avisos += ("Medidor de uso do projeto: a cota semanal está em {0:N0}% (renova em {1}). Nível CRÍTICO: pelo protocolo, encerra-se o dia com /encerrar-dia e o cronograma é refeito até a renovação." -f $p, $renova)
        $estado.niveisSem = @($estado.niveisSem) + 'critico' + 'alerta'
    } elseif ($p -ge $ALERTA_SEMANA -and ($estado.niveisSem -notcontains 'alerta')) {
        $avisos += ("Medidor de uso do projeto: a cota semanal está em {0:N0}% (renova em {1}). Pelo protocolo, o agente cronograma redistribui as tarefas restantes considerando a cota." -f $p, $renova)
        $estado.niveisSem = @($estado.niveisSem) + 'alerta'
    }
}

# --- Contexto da conversa ----------------------------------------------------
if ($null -ne $uso.contexto_pct) {
    $c = [double]$uso.contexto_pct
    if ($c -lt $REARME_CTX) { $estado.ctxAlertado = $false }
    if ($c -ge $ALERTA_CTX -and -not $estado.ctxAlertado) {
        $avisos += ("Medidor de uso do projeto: o contexto desta conversa está em {0:N0}%. Pelo protocolo, atualiza-se .plano/ESTADO.md e o usuário é orientado a executar /compact; a retomada após a compactação é recarregada automaticamente." -f $c)
        $estado.ctxAlertado = $true
    }
}

try { $estado | ConvertTo-Json -Depth 3 | Set-Content -Path $arqAlerta -Encoding UTF8 } catch { }

if ($avisos.Count -eq 0) { exit 0 }

$saida = @{
    hookSpecificOutput = @{
        hookEventName     = $evento
        additionalContext = ($avisos -join "`n")
    }
}
$saida | ConvertTo-Json -Depth 4 -Compress
exit 0
