@echo off
setlocal enabledelayedexpansion

:: =========================================
:: Script: Limpeza do Windows
:: Autor: Steph & ChatGPT (GPT-5)
:: Versao: 3.2
:: =========================================

:: --- Garante execução em uma nova janela independente ---
if not defined IS_RUNNING (
  set IS_RUNNING=1
  start "" cmd /k "%~f0"
  exit
)

title "Limpeza do Windows - Steph & ChatGPT (v3.2 Interativo)"
color 0E

echo ======================
echo   LIMPANDO O WINDOWS
echo ======================
echo.

:: --- Perguntar se quer limpar tudo ---
set opcao=1
set /p opcao="Deseja executar TODAS as limpezas automaticamente? (S/N): "

if /i "%opcao%"!="N" (
  set limparTemp=1
  set limparThumbs=1
  set limparLog=1
  set limparPrefetch=1
  set limparWinSxS=1
  set limparCleanMgr=1
  echo "Limpando automaticamente..."
  goto INICIAR
) else (
  echo.
  echo "Então vamos configurar manualmente cada etapa."
  echo.
)

:: --- Perguntas individuais ---
set /p limparTemp="Deseja limpar arquivos temporarios (usuario e sistema)? (S/N): "
set /p limparThumbs="Deseja limpar cache de miniaturas? (S/N): "
set /p limparLog="Deseja limpar logs do Windows? (S/N): "
set /p limparPrefetch="Deseja limpar Prefetch (cache de programas)? (S/N): "
set /p limparWinSxS="Deseja limpar updates antigos (WinSxS - DISM)? (S/N): "
set /p limparCleanMgr="Deseja rodar o CleanMgr (limpeza avancada do Windows)? (S/N): "

:INICIAR
echo.
echo =========================================
echo            INICIANDO LIMPEZA
echo =========================================
echo.

REM ==============================
REM Fechar Explorer
REM ==============================
echo Fechando Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
echo Windows Explorer fechado.
echo.

REM ==============================
REM Etapa 1: Temp
REM ==============================
if /i "%limparTemp%"=="S" if not defined limparTemp goto SKIPTEMP
if "%limparTemp%"=="1" (
    echo Limpando arquivos temporarios...
    rd /s /q "%TEMP%" >nul 2>&1
    md "%TEMP%"
    rd /s /q "C:\Windows\Temp" >nul 2>&1
    md "C:\Windows\Temp"
    echo Temp limpo.
    echo.
)
:SKIPTEMP

REM ==============================
REM Etapa 2: Miniaturas
REM ==============================
if /i "%limparThumbs%"=="S" if not defined limparThumbs goto SKIPTHUMBS
if "%limparThumbs%"=="1" (
    echo Limpando cache de miniaturas...
    rd /s /q "%LocalAppData%\Microsoft\Windows\Explorer" >nul 2>&1
    md "%LocalAppData%\Microsoft\Windows\Explorer"
    echo Cache de miniaturas limpo.
    echo.
)
:SKIPTHUMBS

REM ==============================
REM Etapa 3: Logs
REM ==============================
if /i "%limparLog%"=="S" if not defined limparLog goto SKIPLOGS
if "%limparLog%"=="1" (
    echo Limpando logs do Windows...
    rd /s /q "C:\Windows\Logs" >nul 2>&1
    md "C:\Windows\Logs"
    echo Logs limpos.
    echo.
)
:SKIPLOGS

REM ==============================
REM Etapa 4: Prefetch
REM ==============================
if /i "%limparPrefetch%"=="S" if not defined limparPrefetch goto SKIPPREFETCH
if "%limparPrefetch%"=="1" (
    echo Limpando Prefetch...
    rd /s /q "C:\Windows\Prefetch" >nul 2>&1
    md "C:\Windows\Prefetch"
    echo Prefetch limpo.
    echo.
)
:SKIPPREFETCH

REM ==============================
REM Etapa 5: WinSxS (DISM)
REM ==============================
if /i "%limparWinSxS%"=="S" if not defined limparWinSxS goto SKIPWINSXS
if "%limparWinSxS%"=="1" (
    echo Limpando WinSxS (componentes antigos)...
    dism.exe /online /cleanup-image /startcomponentcleanup /resetbase
    echo WinSxS otimizado.
    echo.
)
:SKIPWINSXS

REM ==============================
REM Etapa 6: CleanMgr
REM ==============================
if /i "%limparCleanMgr%"=="S" if not defined limparCleanMgr goto SKIPCLEANMGR
if "%limparCleanMgr%"=="1" (
    echo Executando CleanMgr (pode demorar)...
    cleanmgr /sagerun:1
    echo CleanMgr concluido.
    echo.
)
:SKIPCLEANMGR

REM ==============================
REM Reabrir Explorer
REM ==============================
echo Reabrindo Windows Explorer...
start explorer.exe
echo Windows Explorer aberto.
echo.

REM ==============================
REM Finalizacao
REM ==============================
color 0A
echo =====================
echo   LIMPEZA CONCLUIDA
echo =====================
echo.
pause
exit
