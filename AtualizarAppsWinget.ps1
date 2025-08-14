# -------------------------------------
# Script: Atualizacao de Aplicativos via winget
# Autor: ChatGPT (GPT-5) - 2025
# Versão: 1
# -------------------------------------

Write-Host "=== Iniciando verificacao de atualizacoes de aplicativos via winget ==="
Write-Host ""

# 1 - Verificar se winget esta instalado
try {
    winget --version > $null 2>&1
} catch {
    Write-Host "winget nao esta instalado neste sistema. Instale o App Installer pela Microsoft Store." -ForegroundColor Red
    exit
}

# 2 - Listar atualizacoes disponiveis
Write-Host "Buscando atualizacoes disponiveis..."
$updatesRaw = winget upgrade | Select-Object -Skip 1

if (-not $updatesRaw) {
    Write-Host "Nenhum aplicativo com atualizacao disponivel.`n"
    exit
}

# 3 - Montar lista de apps
$apps = @()
$index = 1
foreach ($line in $updatesRaw) {
    $cols = $line -split '\s{2,}'
    if ($cols.Count -ge 2) {
        $apps += [PSCustomObject]@{
            Index = $index
            Nome = $cols[0]
            VersaoAtual = $cols[1]
            VersaoNova = if ($cols.Count -ge 3) { $cols[2] } else { "desconhecida" }
        }
        $index++
    }
}

# 4 - Mostrar lista numerada
Write-Host ""
Write-Host "Aplicativos com atualizacao disponivel:"
foreach ($app in $apps) {
    Write-Host "$($app.Index): $($app.Nome) - Versao atual: $($app.VersaoAtual) - Versao nova: $($app.VersaoNova)"
}

Write-Host ""
$selecionados = Read-Host "Digite os numeros dos aplicativos que deseja atualizar separados por virgula (vazio = todos)"

# 5 - Interpretar escolha
if ($selecionados -eq "") {
    $appsParaAtualizar = $apps
} else {
    $numeros = $selecionados -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^\d+$' }
    $appsParaAtualizar = $apps | Where-Object { $numeros -contains $_.Index.ToString() }
}

# 6 - Atualizar apps selecionados
foreach ($app in $appsParaAtualizar) {
    Write-Host ""
    Write-Host "Atualizando $($app.Nome)..."
    try {
        winget upgrade --id $($app.Nome) --silent --accept-source-agreements --accept-package-agreements
        Write-Host "$($app.Nome) atualizado com sucesso."
    } catch {
        Write-Host "Falha ao atualizar $($app.Nome)."
    }
}

Write-Host ""
Write-Host "=== Processo de atualizacao de aplicativos concluido ==="
Write-Host ""
