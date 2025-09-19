@echo off
setlocal enabledelayedexpansion

:: =========================================
:: Script: Limpeza do Windows
:: Autor: Steph & ChatGPT (GPT-5)
:: Versao: 3.1
:: =========================================

:: --- Garante execução em uma nova janela independente ---
if not defined IS_RUNNING (
    set IS_RUNNING=1
    start "" cmd /k "%~f0"
    exit
)

:: --- Título da Janela ---
title "Limpeza do Windows - Steph & GPT-5"

echo ======================
echo   LIMPANDO O WINDOWS
echo ======================
echo.

:: --- Função simples de mensagem ---
:Message
if "%~1"=="ok" (
    echo [OK] %~2
) else (
    echo [FALHA] %~2
)
goto :eof

:: --- Etapa 1: Fechar Explorer ---
echo.
echo Fechando Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
call :Message ok "Windows Explorer fechado."

:: --- Etapa 2: Limpar arquivos temporários do usuário ---
echo.
echo Limpando arquivos temporarios do usuario...
if exist "%temp%" (
    del /s /f /q "%temp%\*.*" >nul 2>&1
    call :Message ok "Arquivos temporarios do usuario limpos."
) else (
    call :Message fail "Nao foi possivel limpar temporarios do usuario."
)

:: --- Etapa 3: Limpar arquivos temporários do sistema ---
echo.
echo Limpando arquivos temporarios do sistema...
if exist "C:\Windows\Temp" (
    del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
    call :Message ok "Arquivos temporarios do sistema limpos."
) else (
    call :Message fail "Nao foi possivel limpar temporarios do sistema."
)

:: --- Etapa 4: Limpar cache de miniaturas ---
echo.
echo Limpando cache de miniaturas...
if exist "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" (
    del /s /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
    call :Message ok "Cache de miniaturas limpo."
) else (
    call :Message fail "Nao foi possivel limpar cache de miniaturas."
)

:: --- Etapa 5: Limpar logs do Windows ---
echo.
echo Limpando logs do Windows...
if exist "C:\Windows\Logs" (
    del /s /f /q "C:\Windows\Logs\*.*" >nul 2>&1
    call :Message ok "Logs do Windows limpos."
) else (
    call :Message fail "Nao foi possivel limpar logs."
)

:: --- Etapa 6: Reabrir Explorer ---
echo.
echo Reabrindo Windows Explorer...
start explorer.exe
call :Message ok "Windows Explorer reaberto."

:: --- Etapa 7: Finalização ---
echo.
echo =====================
echo   LIMPEZA CONCLUIDA
echo =====================
echo.
pause
exit
