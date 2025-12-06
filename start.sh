#!/bin/bash

echo "======================================================================"
echo "PQR Report Generator - Starting Server"
echo "======================================================================"
echo ""

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt --quiet

# Start the server
echo ""
echo "======================================================================"
echo "Starting Flask server..."
echo "Open your browser and go to: http://localhost:5000"
echo "Press CTRL+C to stop the server"
echo "======================================================================"
echo ""

python app.py
