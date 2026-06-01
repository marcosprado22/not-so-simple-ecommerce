@echo off
echo.
echo ============================================
echo SOLUÇÃO PARA PROBLEMA DE CONECTIVIDADE MCR
echo ============================================
echo.
echo Este script vai tentar várias abordagens para resolver o problema.
echo.

echo 1. Testando conectividade basica...
ping -n 2 mcr.microsoft.com >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Nao consegue pingar mcr.microsoft.com
    goto :error
)

echo 2. Tentando pull direto da imagem...
docker pull mcr.microsoft.com/dotnet/aspnet:9.0-alpine
if %errorlevel% equ 0 goto :success

echo 3. Tentando com timeout maior...
timeout /t 5 >nul
docker pull --no-trunc mcr.microsoft.com/dotnet/aspnet:9.0-alpine
if %errorlevel% equ 0 goto :success

echo 4. Limpando cache do Docker...
docker system prune -f >nul 2>&1

echo 5. Tentando novamente apos limpeza...
docker pull mcr.microsoft.com/dotnet/aspnet:9.0-alpine
if %errorlevel% equ 0 goto :success

echo.
echo ============================================
echo NENHUMA SOLUÇÃO AUTOMÁTICA FUNCIONOU
echo ============================================
echo.
echo Solucoes manuais que voce pode tentar:
echo.
echo A) Usar VPN ou conexao diferente
echo B) Instalar Docker Engine no WSL2 diretamente
echo C) Usar Podman ao inves do Docker Desktop
echo D) Construir em uma VM Linux ou GitHub Actions
echo.
goto :end

:success
echo.
echo ============================================
echo SUCESSO! Imagem baixada com sucesso.
echo ============================================
echo.
echo Agora execute: docker build -f src/services/NotSoSimpleEcommerce.Main/Dockerfile . -t nsse-main
goto :end

:error
echo.
echo ERRO DE REDE: Verifique sua conexao com a internet.
goto :end

:end
pause