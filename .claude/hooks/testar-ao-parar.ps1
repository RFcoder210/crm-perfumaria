# ============================================================================
# testar-ao-parar.ps1 — "Alarme de testes" (hook)
# ----------------------------------------------------------------------------
# Quando roda: quando o Claude termina de responder (evento Stop).
#
# O que faz:
#   Se index.html ou teste.js mudaram desde a última vez que os testes
#   rodaram, executa `npm test`. Se algum teste falhar, devolve o erro ao
#   Claude (código de saída 2) para ele corrigir antes de encerrar.
#
# Por que no fim da resposta e não a cada edição:
#   O npm test leva cerca de 12 segundos. Uma tarefa costuma ter várias
#   edições seguidas; rodar a cada uma deixaria o trabalho lento.
#
# Como evita repetir o teste à toa:
#   Guarda uma "impressão digital" (hash) dos dois arquivos em
#   .plano/estado/ultimo-teste.txt. Se nada mudou, não roda de novo.
#   Essa pasta é gerada por script e fica fora do Git.
# ============================================================================

# UTF-8 sem BOM: evita acentos quebrados na saída
$utf8SemBom = New-Object System.Text.UTF8Encoding $false
[Console]::InputEncoding  = $utf8SemBom
[Console]::OutputEncoding = $utf8SemBom

# TrimStart remove um BOM (marca invisível) que alguns emissores colocam no início
try { $entrada = [Console]::In.ReadToEnd().TrimStart([char]0xFEFF) | ConvertFrom-Json } catch { $entrada = $null }

# Se o Claude já está continuando por causa de um hook de parada, não insiste:
# evita um laço infinito caso o erro não tenha conserto imediato.
if ($entrada -and $entrada.stop_hook_active) { exit 0 }

$raiz = $env:CLAUDE_PROJECT_DIR
if (-not $raiz -and $entrada) { $raiz = $entrada.cwd }
if (-not $raiz) { exit 0 }

$arqIndex = Join-Path $raiz 'index.html'
$arqTeste = Join-Path $raiz 'teste.js'
if (-not (Test-Path $arqIndex) -or -not (Test-Path $arqTeste)) { exit 0 }
if (-not (Test-Path (Join-Path $raiz 'node_modules'))) { exit 0 }

# Impressão digital dos dois arquivos juntos
try {
    $hashIndex = (Get-FileHash -Algorithm SHA256 -Path $arqIndex).Hash
    $hashTeste = (Get-FileHash -Algorithm SHA256 -Path $arqTeste).Hash
    $impressao = "$hashIndex-$hashTeste"
} catch { exit 0 }

$arqUltimo = Join-Path $raiz '.plano/estado/ultimo-teste.txt'
if (Test-Path $arqUltimo) {
    try {
        if ((Get-Content -Raw -Encoding UTF8 $arqUltimo).Trim() -eq $impressao) { exit 0 }
    } catch { }
}

# Roda o teste e captura a saída
Push-Location $raiz
try {
    $saidaTeste = (& cmd.exe /c "npm test 2>&1") | Out-String
    $codigo = $LASTEXITCODE
} catch {
    Pop-Location
    exit 0
}
Pop-Location

if ($codigo -eq 0) {
    try {
        $pasta = Split-Path $arqUltimo
        if (-not (Test-Path $pasta)) { New-Item -ItemType Directory -Path $pasta -Force | Out-Null }
        Set-Content -Path $arqUltimo -Value $impressao -Encoding UTF8
    } catch { }
    @{ systemMessage = 'npm test: todos os testes passaram.' } | ConvertTo-Json -Compress
    exit 0
}

# Falhou: mostra só o que importa (linhas que não são "ok" e o resumo final)
# e devolve ao Claude, para ele corrigir antes de encerrar.
$linhas = $saidaTeste -split "`r?`n" | Where-Object { $_.Trim() -ne '' }
$importantes = $linhas | Where-Object { $_ -notmatch '^\s*ok\s*\|' }
$final = ($importantes | Select-Object -Last 40) -join "`n"
[Console]::Error.WriteLine("O npm test falhou depois das últimas alterações. Corrija antes de encerrar.`n`n$final")
exit 2
