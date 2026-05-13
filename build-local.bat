@echo off
echo Building NotSoSimpleEcommerce.Main service...
cd src\services\NotSoSimpleEcommerce.Main
dotnet publish -c Release -o publish
if %errorlevel% neq 0 (
    echo Build failed!
    exit /b 1
)
echo Build successful!
echo Published files in: src\services\NotSoSimpleEcommerce.Main\publish