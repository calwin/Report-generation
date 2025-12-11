# PQR Report Generator - Intranet Deployment Guide

## Overview
This is a Flask-based web application that generates Standing Committee Reports (DOCX) for PQR (Pre-Qualification Requirements) based on user input.

---

## Deployment Options

### Option 1: Simple Python Deployment (Recommended for Small Teams)

#### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)

#### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/calwin/Report-generation.git
   cd Report-generation
   git checkout v1
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run with Gunicorn (Production)**
   ```bash
   # Linux/Mac
   gunicorn -w 4 -b 0.0.0.0:8001 app:app
   
   # Windows (use waitress instead)
   pip install waitress
   waitress-serve --host=0.0.0.0 --port=8001 app:app
   ```

4. **Access the application**
   - Open browser: `http://<server-ip>:8001`

---

### Option 2: Windows Service Deployment

#### Using NSSM (Non-Sucking Service Manager)

1. **Download NSSM**: https://nssm.cc/download

2. **Install as Windows Service**
   ```cmd
   nssm install PQRReportGenerator
   ```

3. **Configure in NSSM GUI**:
   - **Path**: `C:\Python3x\Scripts\waitress-serve.exe`
   - **Startup directory**: `C:\path\to\Report-generation`
   - **Arguments**: `--host=0.0.0.0 --port=8001 app:app`

4. **Start the service**
   ```cmd
   nssm start PQRReportGenerator
   ```

---

### Option 3: Docker Deployment

1. **Create Dockerfile** (already included or create):
   ```dockerfile
   FROM python:3.11-slim
   WORKDIR /app
   COPY requirements.txt .
   RUN pip install --no-cache-dir -r requirements.txt
   COPY . .
   EXPOSE 8001
   CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8001", "app:app"]
   ```

2. **Build and run**
   ```bash
   docker build -t pqr-report-generator .
   docker run -d -p 8001:8001 --name pqr-app pqr-report-generator
   ```

---

## Configuration

### Environment Variables
| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `8001` | Port to run the application |

### Firewall
Ensure port 8001 (or your chosen port) is open for intranet access.

---

## Files Structure
```
Report-generation/
├── app.py                 # Main Flask application
├── requirements.txt       # Python dependencies
├── templates/
│   └── index_improved.html  # Frontend form
├── static/
│   └── pqr_templates.js   # PQR templates data
├── README.md              # Project documentation
└── DEPLOYMENT.md          # This file
```

---

## Troubleshooting

### Port already in use
```bash
# Linux/Mac
lsof -i :8001
kill -9 <PID>

# Windows
netstat -ano | findstr :8001
taskkill /PID <PID> /F
```

### Permission denied
- Run terminal as Administrator (Windows) or use sudo (Linux/Mac)

### Dependencies not installing
```bash
pip install --upgrade pip
pip install -r requirements.txt --user
```

---

## Support
For issues, contact the development team or raise an issue on GitHub.
