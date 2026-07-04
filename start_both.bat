@echo off
echo Starting Prancing Pony Pub...
echo.

:: Mike creates local git commits for versioned docs.
git config user.name "Prancing Pony Pub Local"
git config user.email "local@prancingponypub.invalid"
if errorlevel 1 exit /b %errorlevel%

:: Clean local versioned build output
mike delete --all >nul 2>&1
if exist site rmdir /s /q site >nul 2>&1

mike deploy --config-file mkdocs-2018.yml mesbg2018
if errorlevel 1 exit /b %errorlevel%

mike deploy --config-file mkdocs-2024.yml mesbg2024
if errorlevel 1 exit /b %errorlevel%

mike set-default --config-file mkdocs-2024.yml mesbg2024
if errorlevel 1 exit /b %errorlevel%

echo.
echo ================================================
echo Site is ready!
echo   http://127.0.0.1:8000/        - MESBG 2024 default
echo   http://127.0.0.1:8000/mesbg2018/ - MESBG 2018
echo   http://127.0.0.1:8000/mesbg2024/ - MESBG 2024
echo ================================================
echo.
mike serve --config-file mkdocs-2024.yml
