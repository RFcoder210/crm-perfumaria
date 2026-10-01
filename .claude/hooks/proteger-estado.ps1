# ============================================================================
# proteger-estado.ps1 — "Cadeado" da pasta .plano/estado/ (hook)
# ----------------------------------------------------------------------------
# Quando roda: antes de o Claude editar ou criar um arquivo (PreToolUse,
# ferramentas Edit e Write).
#
# O que faz:
#   Recusa a edição se o arquivo estiver dentro de .plano/estado/. Essa pasta
#   é gerada pelos scripts do medidor de uso e, segundo o CLAUDE.md, não deve
#   ser editada manualmente. O .gitkeep é a única exceção.
#
# Observação:
#   Os scripts do medidor continuam gravando nessa pasta normalmente, porque
#   o cadeado vale apenas para as ferramentas de edição do Claude.
# ============================================================================

# UTF-8 sem BOM: evita acentos quebrados na saída
$utf8SemBom = New-Object System.Text.UTF8Encoding $false
[Console]::InputEncoding  = $utf8SemBom
[Console]::OutputEncoding = $utf8SemBom

# TrimStart remove um BOM (marca invisível) que alguns emissores colocam no início
try { $entrada = [Console]::In.ReadToEnd().TrimStart([char]0xFEFF) | ConvertFrom-Json } catch { exit 0 }
if (-not $entrada -or -not $entrada.tool_input) { exit 0 }

$caminho = $entrada.tool_input.file_path
if (-not $caminho) { exit 0 }

# Barras iguais e minúsculas, para comparar sem se confundir com o Windows
$norm = ($caminho -replace '\\', '/').ToLowerInvariant()

if ($norm -match '/\.plano/estado/' -and $norm -notmatch '/\.gitkeep$') {
    [Console]::Error.WriteLine("Bloqueado: .plano/estado/ é gerado por scripts (medidor de uso) e não deve ser editado manualmente. Se o conteúdo estiver errado, corrija o script que o gera, em .claude/hooks/.")
    exit 2
}
exit 0
