<#
=========================================
Script: Atualização Automática de Drivers (WinUpdate + Fabricantes)
Autor: Steph & ChatGPT (GPT-5)
Versao: 2.0
=========================================
#>
Write-Host "===============================================" -ForegroundColor Yellow
Write-Host "| Iniciando atualizacao automatica de drivers |" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Yellow
Write-Host ""

# 0 - Garantir que a política de execução permite rodar scripts
$currentPolicy = Get-ExecutionPolicy -Scope Process
if ($currentPolicy -eq "Restricted" -or $currentPolicy -eq "AllSigned") {
  Write-Host "Politica de execucao restritiva detectada. Ajustando para Bypass nesta sessao..." -ForegroundColor Yellow
  try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
    Write-Host "Politica ajustada para Bypass nesta sessao." -ForegroundColor Green
  } catch {
    Write-Host "Nao foi possivel alterar a politica de execucao. Rode como administrador." -ForegroundColor Red
    Pause
    exit
  }
}

# 0.1 - Garantir que o PowerShell está rodando como Administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
  Write-Host "Este script precisa ser executado em modo Administrador." -ForegroundColor Red
  Write-Host "Clique com o botao direito no PowerShell e selecione 'Executar como administrador'." -ForegroundColor Yellow
  Pause
  exit
}

# 1 - Garantir que o módulo PSWindowsUpdate está instalado
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
  Write-Host "Instalando modulo PSWindowsUpdate..." -ForegroundColor Yellow
  Install-PackageProvider -Name NuGet -Force
  Install-Module -Name PSWindowsUpdate -Force
}

Import-Module PSWindowsUpdate

# 2 - Procurar e instalar drivers automaticamente
Write-Host "`nProcurando drivers no Windows Update..." -ForegroundColor Cyan
$driversWU = Get-WindowsUpdate -MicrosoftUpdate -Category Drivers -IgnoreReboot

if ($driversWU) {
  Write-Host "Foram encontrados os seguintes drivers:" -ForegroundColor Green
  $driversWU | Format-Table -AutoSize

  Write-Host "`nInstalando drivers..." -ForegroundColor Yellow
  Install-WindowsUpdate -MicrosoftUpdate -Category Drivers -AcceptAll -AutoReboot
  $winUpdated = $true
} else {
  Write-Host "Nenhum driver encontrado no Windows Update." -ForegroundColor DarkGray
  $winUpdated = $false
}

# 3 - Mostrar últimas versões conhecidas de fabricantes
Write-Host ""
Write-Host "Voce tambem pode atualizar pelo site dos fabricantes:" -ForegroundColor Cyan

# NVIDIA
Write-Host "NVIDIA - Verifique via site oficial: https://www.nvidia.com/Download/index.aspx" -ForegroundColor Blue

# Intel
Write-Host "Intel - Verifique via Assistente de Drivers: https://downloadcenter.intel.com/DriverUpdate" -ForegroundColor Blue

# AMD
Write-Host "AMD - Verifique via site oficial: https://www.amd.com/en/support" -ForegroundColor Blue

Write-Host ""
Write-Host "======================" -ForegroundColor Green
Write-Host "| Processo concluido |" -ForegroundColor Green
Write-Host "======================" -ForegroundColor Green
Write-Host ""

if ($winUpdated) {
  Write-Host "OBS: Drivers instalados via Windows Update ja foram aplicados. Reinicializacao pode ser necessaria." -ForegroundColor Yellow
  Write-Host ""
}

Pause
exit
