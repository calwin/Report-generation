# PQR Report Generator - Installation Guide

## What's in this package?
- `PQR_Report_Generator.exe` - The application
- `INSTALL_SERVICE.bat` - Installs as Windows Service
- `UNINSTALL_SERVICE.bat` - Removes the service

---

## Installation Steps (One-Time Setup)

### Step 1: Download NSSM
1. Go to: https://nssm.cc/download
2. Download the latest version
3. Extract the ZIP
4. Copy `nssm.exe` (from win64 folder) to THIS folder

### Step 2: Install the Service
1. Right-click `INSTALL_SERVICE.bat`
2. Select "Run as administrator"
3. Follow the prompts
4. Done!

---

## After Installation

### For users on ANY computer in your network:
1. Open Chrome/Edge browser
2. Go to: `http://<server-name>:8001`
   
   Example: `http://MYSERVER:8001`

### The service will:
- Run automatically when Windows starts
- Keep running even if no one is logged in
- Restart if it crashes

---

## Troubleshooting

### Can't access from other computers?
→ Ask IT to open port 8001 in Windows Firewall

### Service not starting?
→ Check `service.log` file for errors

### Need to restart the service?
1. Open "Services" (search for services.msc)
2. Find "PQR Report Generator"
3. Right-click → Restart

---

## To Uninstall
1. Right-click `UNINSTALL_SERVICE.bat`
2. Select "Run as administrator"
