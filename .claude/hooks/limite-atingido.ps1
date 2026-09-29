# ============================================================================
# limite-atingido.ps1 — "Caixa-preta" da interrupção por limite (hook)
# ----------------------------------------------------------------------------
# Quando roda: quando uma resposta do Claude é interrompida porque o limite
# de uso acabou (evento StopFailure, tipo rate_limit).
#
# Por que é um script e não um agente:
#   Com o limite esgotado, nenhum agente consegue trabalhar. Um script
#   simples, que não gasta tokens, ainda consegue anotar o ocorrido.
#
# O que faz:
#   Acrescenta ao final de .plano/RETOMADA.md um aviso com data, hora e a
#   previsão de renovação, para que a próxima sessão saiba que houve
#   interrupção e confira .plano/ESTADO.md antes de continuar.
# ============================================================================

# UTF-8 sem BOM: evita acentos quebrados e caracteres invisíveis na saída
$utf8SemBom = New-Object System.Text.UTF8Encoding $false
[Console]::InputEncoding  = $utf8SemBom
[Console]::OutputEncoding = $utf8SemBom

try { $entrada = [Console]::In.ReadToEnd() | ConvertFrom-Json } catch { $entrada = $null }

$raiz = $env:CLAUDE_PROJECT_DIR
if (-not $raiz -and $entrada) { $raiz = $entrada.cwd }
if (-not $raiz) { exit 0 }

$pastaPlano = Join-Path $raiz '.plano'
if (-not (Test-Path $pastaPlano)) { exit 0 }

$renovacao = 'desconhecida'
$arqUso = Join-Path $pastaPlano 'estado/uso.json'
if (Test-Path $arqUso) {
    try {
        $uso = Get-Content -Raw -Encoding UTF8 $arqUso | ConvertFrom-Json
        if ($uso.janela_5h_pct -ge $uso.semanal_pct -or $null -eq $uso.semanal_pct) {
            if ($uso.janela_5h_renova_hora) { $renovacao = "janela de 5 h renova às " + $uso.janela_5h_renova_hora }
        } else {
            if ($uso.semanal_renova_data) { $renovacao = "cota semanal renova em " + $uso.semanal_renova_data }
        }
    } catch { }
}

$bloco = @"

## ⚠ Interrupção por limite de uso
- Momento: $((Get-Date).ToString('yyyy-MM-dd HH:mm'))
- Renovação prevista: $renovacao
- A sessão parou no meio do trabalho. Tarefas marcadas como EM_ANDAMENTO em
  .plano/ESTADO.md podem estar incompletas: conferir antes de retomar.
"@

$arqRetomada = Join-Path $pastaPlano 'RETOMADA.md'
try { Add-Content -Path $arqRetomada -Value $bloco -Encoding UTF8 } catch { }

$arqLog = Join-Path $pastaPlano 'estado/interrupcoes.log'
try {
    $pasta = Split-Path $arqLog
    if (-not (Test-Path $pasta)) { New-Item -ItemType Directory -Path $pasta -Force | Out-Null }
    Add-Content -Path $arqLog -Value ("{0} | limite de uso | {1}" -f (Get-Date).ToString('yyyy-MM-dd HH:mm'), $renovacao) -Encoding UTF8
} catch { }
exit 0
