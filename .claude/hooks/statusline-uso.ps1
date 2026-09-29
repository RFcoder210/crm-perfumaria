# ============================================================================
# statusline-uso.ps1 — Barra de status + "medidor de uso" do projeto
# ----------------------------------------------------------------------------
# O que faz (em linguagem simples):
#   O Claude Code chama este script várias vezes durante a sessão e entrega a
#   ele, em formato JSON, dados como: % do contexto usado, % da janela de uso
#   de 5 horas e % da janela semanal (estes dois só em planos Pro/Max).
#   O script faz duas coisas:
#     1) Grava esses números em .plano/estado/uso.json, para que os outros
#        scripts (hooks) saibam quando o limite está chegando.
#     2) Imprime uma linha curta que aparece no rodapé do Claude Code.
#
# Analogia: é o "marcador de combustível" do carro. Ele não dirige; apenas
# mostra quanto resta e anota o valor para o computador de bordo.
# ============================================================================

# UTF-8 sem BOM: evita acentos quebrados e caracteres invisíveis na saída
$utf8SemBom = New-Object System.Text.UTF8Encoding $false
[Console]::InputEncoding  = $utf8SemBom
[Console]::OutputEncoding = $utf8SemBom

try {
    $dados = [Console]::In.ReadToEnd() | ConvertFrom-Json
} catch {
    Write-Output "[uso indisponível]"
    exit 0
}

# --- Leitura dos números (qualquer um pode vir vazio) -----------------------
$ctx      = $dados.context_window.used_percentage
$cinco    = $dados.rate_limits.five_hour.used_percentage
$cincoRst = $dados.rate_limits.five_hour.resets_at
$semana   = $dados.rate_limits.seven_day.used_percentage
$semRst   = $dados.rate_limits.seven_day.resets_at
$modelo   = $dados.model.display_name

function Converter-Hora($epoch, $formato) {
    if ($null -eq $epoch) { return $null }
    try {
        return [DateTimeOffset]::FromUnixTimeSeconds([long]$epoch).ToLocalTime().ToString($formato)
    } catch { return $null }
}

$cincoHora = Converter-Hora $cincoRst 'HH:mm'
$semData   = Converter-Hora $semRst 'dd/MM HH:mm'

# --- 1) Gravar o medidor em .plano/estado/uso.json ---------------------------
$raiz = $dados.workspace.project_dir
if (-not $raiz) { $raiz = $dados.cwd }

if ($raiz -and (Test-Path (Join-Path $raiz '.plano'))) {
    $pastaEstado = Join-Path $raiz '.plano/estado'
    if (-not (Test-Path $pastaEstado)) {
        New-Item -ItemType Directory -Path $pastaEstado -Force | Out-Null
    }
    $registro = [ordered]@{
        atualizado_em          = (Get-Date).ToString('yyyy-MM-ddTHH:mm:ss')
        sessao                 = $dados.session_id
        contexto_pct           = $ctx
        janela_5h_pct          = $cinco
        janela_5h_renova_epoch = $cincoRst
        janela_5h_renova_hora  = $cincoHora
        semanal_pct            = $semana
        semanal_renova_epoch   = $semRst
        semanal_renova_data    = $semData
    }
    try {
        $registro | ConvertTo-Json -Depth 3 |
            Set-Content -Path (Join-Path $pastaEstado 'uso.json') -Encoding UTF8
    } catch { }
}

# --- 2) Linha exibida no rodapé ---------------------------------------------
$partes = @()
if ($modelo) { $partes += "[$modelo]" }
if ($null -ne $ctx) { $partes += ("ctx {0:N0}%" -f [double]$ctx) }
if ($null -ne $cinco) {
    $txt = "5h {0:N0}%" -f [double]$cinco
    if ($cincoHora) { $txt += " (renova $cincoHora)" }
    $partes += $txt
}
if ($null -ne $semana) { $partes += ("semana {0:N0}%" -f [double]$semana) }

if ($partes.Count -eq 0) { Write-Output "[aguardando primeira resposta]" }
else { Write-Output ($partes -join ' | ') }
exit 0
