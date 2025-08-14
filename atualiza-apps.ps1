<#
=========================================
Script: Atualizacao de Aplicativos via winget
Autor: Steph & ChatGPT (GPT-5)
Versao: 2.0
=========================================
#>
Write-Host "===================================================" -ForegroundColor Yellow
Write-Host "| Iniciando atualizacao de aplicativos via winget |" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Yellow
Write-Host ""

winget upgrade --all --uninstall-previous --accept-package-agreements --accept-source-agreements --silent --include-unknown

Write-Host ""
Write-Host "=====================================" -ForegroundColor Green
Write-Host "| Processo de atualizacao concluido |" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
Write-Host ""
Pause
exit
