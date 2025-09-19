<#
=========================================
Script: Limpeza do Windows
Autor: Steph & ChatGPT (GPT-5)
Versao: 2.0
=========================================
#>

Write-Host "======================" -ForegroundColor Yellow
Write-Host "| LIMPANDO O WINDOWS |" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Yellow
Write-Host ""

# --- Função para escrever mensagem ---
function Return-Message {
    param (
        [bool]$Success
    )

    if ($Success) {
        Write-Host "Arquivos temporarios limpos." -ForegroundColor Green
    } else {
        Write-Host "Não foi possível limpar arquivos temporários." -ForegroundColor Red
    }
}

# --- Etapa 1: Fechar Explorer ---
Write-Host "`nFechando Windows Explorer..." -ForegroundColor Yellow
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Write-Host "Windows Explorer fechado." -ForegroundColor Green

# --- Etapa 2: Limpar arquivos temporários ---
Write-Host "`nLimpando arquivos temporarios do usuario..." -ForegroundColor Yellow
if (Test-Path $env:TEMP) {
  Get-ChildItem -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  Return-Message $true
}
else {
  Return-Message $false
}

Write-Host "`nLimpando arquivos temporarios do sistema..." -ForegroundColor Yellow
if (Test-Path "C:\Windows\Temp") {
  Get-ChildItem -Path "C:\Windows\Temp" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  Return-Message $true
}
else {
  Return-Message $false
}

# --- Etapa 3: Limpar cache de miniaturas ---
Write-Host "`nLimpando cache de miniaturas..." -ForegroundColor Yellow
if (Test-Path "$env:LocalAppData\Microsoft\Windows\Explorer\thumbcache_*.db") {
  Get-ChildItem -Path "$env:LocalAppData\Microsoft\Windows\Explorer\thumbcache_*.db" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  Return-Message $true
}
else {
  Return-Message $false
}

# --- Etapa 4: Limpar logs do Windows ---
Write-Host "`nLimpando logs do Windows..." -ForegroundColor Yellow
if (Test-Path "C:\Windows\Logs\*") {
  Get-ChildItem -Path "C:\Windows\Logs\*" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  Return-Message $true
}
else {
  Return-Message $false
}

# --- Etapa 5: Reabrir Explorer ---
Write-Host "`nReabrindo Windows Explorer..." -ForegroundColor Yellow
explorer .
Write-Host "Windows Explorer aberto." -ForegroundColor Green

# --- Etapa 6: Finalização ---
Write-Host ""
Write-Host "=====================" -ForegroundColor Green
Write-Host "| LIMPEZA CONCLUIDA |" -ForegroundColor Green
Write-Host "=====================" -ForegroundColor Green
Write-Host ""
Pause
exit
