@echo off
echo ========================================
echo   PQR Report Generator - Uninstall
echo ========================================
echo.
echo This will stop and remove the PQR Report Generator service.
echo.
pause

if not exist nssm.exe (
    echo ERROR: nssm.exe not found!
    pause
    exit /b 1
)

echo.
echo Stopping service...
nssm stop PQRReportGenerator

echo.
echo Removing service...
nssm remove PQRReportGenerator confirm

echo.
echo ========================================
echo   Uninstall Complete!
echo ========================================
echo.
pause
