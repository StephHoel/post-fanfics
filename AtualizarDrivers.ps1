# -------------------------------------
# Script: Atualização Automática de Drivers (WinUpdate + Fabricantes) - Auto Desbloqueio
# Autor: ChatGPT (GPT-5) - 2025
# Versão: 2
# -------------------------------------

$scriptPath = $MyInvocation.MyCommand.Path

Write-Host "=== Iniciando atualizacao automatica de drivers... ===" -ForegroundColor Cyan

# 0 - Detectar bloqueio por arquivo vindo da internet e tentar desbloquear
if (Get-Item $scriptPath -Stream "Zone.Identifier" -ErrorAction SilentlyContinue) {
  Write-Host "Arquivo bloqueado pela marcacao de origem (Internet). Tentando desbloquear..." -ForegroundColor Yellow
  try {
    Unblock-File -Path $scriptPath
    Write-Host "Arquivo desbloqueado com sucesso." -ForegroundColor Green
  } catch {
    Write-Host "Falha ao desbloquear o arquivo. Rode manualmente: Unblock-File -Path '$scriptPath'" -ForegroundColor Red
  }
}

# 0.1 - Garantir que a política de execução permite rodar scripts
$currentPolicy = Get-ExecutionPolicy -Scope Process
if ($currentPolicy -eq "Restricted" -or $currentPolicy -eq "AllSigned") {
  Write-Host "Politica de execucao restritiva detectada. Ajustando para Bypass nesta sessao..." -ForegroundColor Yellow
  try {
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
    Write-Host "Politica ajustada para Bypass nesta sessao." -ForegroundColor Green
  } catch {
    Write-Host "Nao foi possivel alterar a politica de execucao. Rode como administrador." -ForegroundColor Red
    exit
  }
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
} else {
    Write-Host "Nenhum driver encontrado no Windows Update." -ForegroundColor DarkGray
}

# 3 - Mostrar últimas versões conhecidas de fabricantes
Write-Host "`nTente baixar pelas ultimas versoes conhecidas dos fabricantes:" -ForegroundColor Cyan

# NVIDIA
Write-Host "NVIDIA - Verifique via site oficial: https://www.nvidia.com/Download/index.aspx" -ForegroundColor Blue

# Intel
Write-Host "Intel - Verifique via Assistente de Drivers: https://downloadcenter.intel.com/DriverUpdate" -ForegroundColor Blue

# AMD
Write-Host "AMD - Verifique via site oficial: https://www.amd.com/en/support" -ForegroundColor Blue

Write-Host "`n=== Processo concluido ===" -ForegroundColor Cyan
Write-Host "OBS: Drivers instalados via Windows Update ja foram aplicados. Reinicializacao pode ser necessaria." -ForegroundColor Yellow
