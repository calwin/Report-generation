@echo off
echo ========================================
echo   PQR Report Generator - Service Install
echo ========================================
echo.
echo This will install PQR Report Generator as a Windows Service.
echo The service will start automatically when Windows boots.
echo.
echo REQUIREMENTS:
echo   1. Run this as Administrator
echo   2. nssm.exe must be in this folder (download from https://nssm.cc/download)
echo.
pause

REM Check if nssm exists
if not exist nssm.exe (
    echo.
    echo ERROR: nssm.exe not found!
    echo.
    echo Please download NSSM from: https://nssm.cc/download
    echo Extract and copy nssm.exe to this folder.
    echo.
    pause
    exit /b 1
)

REM Get current directory
set APPDIR=%~dp0

echo.
echo Installing service...

REM Remove existing service if any
nssm stop PQRReportGenerator 2>nul
nssm remove PQRReportGenerator confirm 2>nul

REM Install new service
nssm install PQRReportGenerator "%APPDIR%PQR_Report_Generator.exe"
nssm set PQRReportGenerator AppDirectory "%APPDIR%"
nssm set PQRReportGenerator DisplayName "PQR Report Generator"
nssm set PQRReportGenerator Description "Web application for generating PQR Standing Committee Reports"
nssm set PQRReportGenerator Start SERVICE_AUTO_START
nssm set PQRReportGenerator AppStdout "%APPDIR%service.log"
nssm set PQRReportGenerator AppStderr "%APPDIR%service.log"
nssm set PQRReportGenerator AppEnvironmentExtra RUNNING_AS_SERVICE=1

echo.
echo Starting service...
nssm start PQRReportGenerator

echo.
echo ========================================
echo   Installation Complete!
echo ========================================
echo.
echo The service is now running in the background.
echo.
echo Access the application at:
echo   - This computer: http://localhost:8001
echo   - Other computers: http://%COMPUTERNAME%:8001
echo.
echo The service will automatically start when Windows boots.
echo.
echo To check service status: Open Services (services.msc)
echo                          Look for "PQR Report Generator"
echo.
pause
