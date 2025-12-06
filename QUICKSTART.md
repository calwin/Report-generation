# Quick Start Guide

## Get Started in 3 Steps

### Step 1: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 2: Start the Server
```bash
python app.py
```

Or use the startup script:
```bash
./start.sh
```

### Step 3: Open the Form
Open your browser and go to:
```
http://localhost:5000
```

## That's it!

You should see a web form where contractors can:
- Fill in work details
- Check applicable requirements
- Click "Generate Report"
- Download the report as a DOCX file

## Testing the API

To test if everything works, run:
```bash
python test_api.py
```

This will generate a sample report called `test_report.docx`

## Need Help?

See [README.md](README.md) for detailed documentation.

## Common Issues

**Port already in use?**
```bash
# Find what's using port 5000
lsof -i :5000

# Kill the process or change the port in app.py
```

**Dependencies not installing?**
```bash
# Use Python 3.8 or higher
python3 --version

# Update pip
pip install --upgrade pip
```
