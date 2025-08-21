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

title Limpeza do Windows (v3.2 Interativo)
color 0E

echo ======================
echo   LIMPANDO O WINDOWS
echo ======================
echo.

:: --- Perguntar se quer limpar tudo ---
set opcao=1
set /p opcao="Deseja executar TODAS as limpezas automaticamente? (S/n): "

set limparTemp=1
set limparThumbs=1
set limparLog=1
set limparPrefetch=1
set limparWinSxS=1
set limparCleanMgr=1

echo.
if /i "%opcao%"=="S" (
  echo Limpando automaticamente...
  goto INICIAR
) else (
  if "%opcao%"=="1" (
    set opcao=s
    echo Limpando automaticamente...
    goto INICIAR
  ) else (
    echo Entao vamos configurar manualmente cada etapa...
  )
)
echo.

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

:: Se opcao != s
:: Pergunta se quer limpar
:: Se a resposta for s ou vazio, limpa
:: Senão, pula
:: Senão, limpa

REM ==============================
REM Reabrir Explorer
REM ==============================
echo Reabrindo Windows Explorer...
start explorer.exe
explorer .
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
