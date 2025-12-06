# PQR Report Generator

Automated system to generate Standing Committee Reports from contractor questionnaire responses.

## Features

- Web-based form for contractors to fill out PQR checklist
- Automatic report generation in DOCX format
- Simple Flask backend with HTML/JavaScript frontend
- No database required - reports generated on-the-fly

## Project Structure

```
Report generation/
├── app.py                          # Flask backend server
├── requirements.txt                # Python dependencies
├── templates/
│   └── index.html                  # Frontend form
├── Check list format-elec.docx     # Original checklist template
└── Report of the Standing Committee - R1.docx  # Example report
```

## Installation

### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)

### Setup Steps

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Run the server:
```bash
python app.py
```

3. Open your browser and navigate to:
```
http://localhost:5000
```

## Usage

### For Contractors (Frontend)

1. Open the web form at `http://localhost:5000`
2. Fill in the basic information:
   - Name of Work
   - Period of Work
   - Nature of Work (AMC/BMC)
   - Estimate Value

3. Check applicable requirements:
   - Technical Requirements
   - Financial Requirements
   - Documentation Requirements
   - Additional Notes

4. Click "Generate Report"
5. Report will be automatically downloaded as a DOCX file

### For Administrators (Backend)

The Flask server provides two endpoints:

- `GET /` - Serves the form interface
- `POST /api/generate-report` - Generates report from JSON data
- `GET /api/health` - Health check endpoint

#### API Example

```bash
curl -X POST http://localhost:5000/api/generate-report \
  -H "Content-Type: application/json" \
  -d '{
    "work_name": "Electrical Maintenance Works",
    "work_period": "24 months",
    "work_nature": "BMC",
    "estimate_value": "Rs. 50,00,000",
    "tech_experience": "The bidder should have executed...",
    "turnover_requirement": "Avg. Annual Turnover...",
    "req_work_order": true,
    "note_exclude_gst": true
  }' \
  --output report.docx
```

## Configuration

### Port Configuration
Default port is 5000. To change it, edit [app.py](app.py:265):
```python
app.run(debug=True, host='0.0.0.0', port=5000)
```

### Production Deployment

For production, use a WSGI server like Gunicorn:

```bash
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

## Form Fields Reference

### Required Fields
- Name of Work
- Period of Work
- Nature of Work
- Estimate Value

### Optional Checkboxes
All technical, financial, and documentation requirements are optional and will only appear in the report if checked.

## Troubleshooting

### Server won't start
- Check if port 5000 is already in use
- Ensure all dependencies are installed: `pip install -r requirements.txt`

### Report generation fails
- Check browser console for errors
- Verify all required fields are filled
- Check server logs for backend errors

### Generated report formatting issues
- Ensure python-docx is properly installed
- Check that template formatting is correct

## Development

To modify the report template:
1. Edit the `ReportGenerator` class in [app.py](app.py)
2. Modify the `_build_pqr_content()` method for content changes
3. Adjust table structure in the `generate()` method

To modify the form:
1. Edit [templates/index.html](templates/index.html)
2. Add/remove form fields as needed
3. Update the JavaScript form submission handler

## License

Internal company use only.
