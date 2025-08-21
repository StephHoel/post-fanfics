<#
=========================================
Script: Otimizacao do Windows
Autor: Steph & ChatGPT (GPT-5)
Versao: 1.0
=========================================
#>
Write-Host "========================" -ForegroundColor Yellow
Write-Host "| OTIMIZANDO O WINDOWS |" -ForegroundColor Cyan
Write-Host "========================" -ForegroundColor Yellow
Write-Host ""

# --- Função para parar e desativar serviços ---
function Stop-And-DisableService {
  param (
    [string]$ServiceName,
    [string]$Description
  )
  $service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
  if ($service) {
    if ($service.Status -ne 'Stopped') {
      Write-Host "Parando servico: $Description" -ForegroundColor Yellow
      Stop-Service -Name $ServiceName -Force
    }
    Write-Host "Desativando servico: $Description" -ForegroundColor Red
    Set-Service -Name $ServiceName -StartupType Disabled
  } else {
    Write-Host "Servico $Description nao encontrado." -ForegroundColor DarkGray
  }
}


# --- Etapa 1: Desativar serviços para melhorar performance ---
Write-Host "`nDesativando servicos desnecessarios..." -ForegroundColor Cyan

$servicesToDisable = @(
    # @{Name="XblGameSave"; Desc="Xbox Live Game Save"},
    # @{Name="XboxNetApiSvc"; Desc="Xbox Live Networking"},
    # @{Name="XboxGipSvc"; Desc="Xbox Accessory Management"},
    # @{Name="dmwappushservice"; Desc="Device Management Wireless Application Protocol"},

    @{Name="WSearch"; Desc="Windows Search (Indexador)"},
    @{Name="SysMain"; Desc="SysMain / Superfetch"},
    @{Name="DiagTrack"; Desc="Connected User Experiences and Telemetry"},
    @{Name="Fax"; Desc="Fax Service"},
    @{Name="RemoteRegistry"; Desc="Remote Registry"},
    @{Name="MapsBroker"; Desc="Download de Mapas Offline"},
    @{Name="RetailDemo"; Desc="Modo Demo de Loja"},
    @{Name="WerSvc"; Desc="Windows Error Reporting"},
    @{Name="SharedAccess"; Desc="Internet Connection Sharing"},
    @{Name="TabletInputService"; Desc="Serviço de Caneta e Toque"}
)

foreach ($svc in $servicesToDisable) {
  Stop-And-DisableService -ServiceName $svc.Name -Description $svc.Desc
}

# --- Etapa 2: Finalização ---
Write-Host ""
Write-Host "========================" -ForegroundColor Green
Write-Host "| OTIMIZACAO CONCLUIDA |" -ForegroundColor Green
Write-Host "========================" -ForegroundColor Green
Write-Host ""
Pause
exit
