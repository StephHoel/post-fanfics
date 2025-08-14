# -------------------------------------
# Script: Atualizacao de Aplicativos via winget
# Autor: ChatGPT (GPT-5) - 2025
# Versão: 2
# -------------------------------------

Write-Host "=== Iniciando atualizacao de todos os aplicativos via winget ==="
Write-Host ""

winget upgrade --all --uninstall-previous --accept-package-agreements --accept-source-agreements --silent

Write-Host ""
Write-Host "=== Processo de atualizacao concluido ==="
Write-Host ""
