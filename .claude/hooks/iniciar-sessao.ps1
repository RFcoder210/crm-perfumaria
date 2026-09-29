# ============================================================================
# iniciar-sessao.ps1 — Carrega SOMENTE o contexto de retomada (hook)
# ----------------------------------------------------------------------------
# Quando roda: ao abrir o Claude Code, ao retomar uma conversa, após /clear
# e após uma compactação de contexto.
#
# O que faz:
#   Entrega ao Claude a data de hoje e o conteúdo de .plano/RETOMADA.md.
#   Nada além disso: o histórico antigo NÃO é carregado. É o "bilhete na
#   geladeira" do turno anterior — curto e suficiente para continuar.
# ============================================================================

# UTF-8 sem BOM: evita acentos quebrados e caracteres invisíveis na saída
$utf8SemBom = New-Object System.Text.UTF8Encoding $false
[Console]::InputEncoding  = $utf8SemBom
[Console]::OutputEncoding = $utf8SemBom

$LIMITE_CARACTERES = 7000   # o Claude Code aceita até 10.000 por hook

try { $entrada = [Console]::In.ReadToEnd() | ConvertFrom-Json } catch { $entrada = $null }

$raiz = $env:CLAUDE_PROJECT_DIR
if (-not $raiz -and $entrada) { $raiz = $entrada.cwd }
if (-not $raiz) { exit 0 }

$origem = ''
if ($entrada) { $origem = [string]$entrada.source }

$ptBR = [System.Globalization.CultureInfo]::GetCultureInfo('pt-BR')
$agora = Get-Date
$linhas = @()
$linhas += ("Data atual: {0} ({1}), {2}." -f $agora.ToString('yyyy-MM-dd'), $agora.ToString('dddd', $ptBR), $agora.ToString('HH:mm'))

$pastaPlano = Join-Path $raiz '.plano'
if (-not (Test-Path $pastaPlano)) {
    $linhas += "Este projeto ainda não possui a pasta .plano do sistema de agentes."
    Write-Output ($linhas -join "`n")
    exit 0
}

$arqObjetivo = Join-Path $pastaPlano 'OBJETIVO.md'
$arqPlano    = Join-Path $pastaPlano 'PLANO.md'
$arqRetomada = Join-Path $pastaPlano 'RETOMADA.md'

if (-not (Test-Path $arqPlano)) {
    $linhas += "Situação do sistema de agentes: ainda não existe .plano/PLANO.md. O primeiro passo é o usuário preencher .plano/OBJETIVO.md e executar /orquestrar."
    Write-Output ($linhas -join "`n")
    exit 0
}

if ($origem -eq 'compact') {
    $linhas += "A conversa acabou de ser compactada. O estado detalhado das tarefas está em .plano/ESTADO.md."
}

if (Test-Path $arqRetomada) {
    $texto = Get-Content -Raw -Encoding UTF8 $arqRetomada
    if (-not $texto) { $texto = '(arquivo vazio)' }
    if ($texto.Length -gt $LIMITE_CARACTERES) {
        $texto = $texto.Substring(0, $LIMITE_CARACTERES) + "`n[... RETOMADA.md truncado; ler o arquivo completo se necessário ...]"
    }
    $linhas += "Contexto de retomada do projeto (conteúdo de .plano/RETOMADA.md):"
    $linhas += "-----"
    $linhas += $texto.Trim()
    $linhas += "-----"
} else {
    $linhas += "Não há .plano/RETOMADA.md; o estado das tarefas está em .plano/ESTADO.md."
}

# Última medição de uso, se houver
$arqUso = Join-Path $pastaPlano 'estado/uso.json'
if (Test-Path $arqUso) {
    try {
        $uso = Get-Content -Raw -Encoding UTF8 $arqUso | ConvertFrom-Json
        $quando = [string]$uso.atualizado_em
        try { $quando = ([datetime]$uso.atualizado_em).ToString('dd/MM HH:mm') } catch { }
        $p5 = 'n/d'; if ($null -ne $uso.janela_5h_pct) { $p5 = "$($uso.janela_5h_pct)%" }
        $pS = 'n/d'; if ($null -ne $uso.semanal_pct) { $pS = "$($uso.semanal_pct)%" }
        $linhas += ("Última medição de uso registrada ({0}): janela 5h {1}, semana {2}." -f $quando, $p5, $pS)
    } catch { }
}

$linhas += "O ciclo de trabalho do projeto é conduzido pelo comando /orquestrar."
Write-Output ($linhas -join "`n")
exit 0
