#!/bin/bash
set -e

# Install dependencies
if [ -f requirements.txt ]; then
    echo "Installing Python dependencies from requirements.txt..."
    pip install --upgrade pip
    pip install -r requirements.txt
fi

if [ -f package.json ]; then
    echo "Installing Node.js dependencies from package.json..."
    npm install
fi

# Custom setup commands
echo "Running additional setup tasks..."

# Add more setup tasks below as needed
# e.g., installing OS packages, setting up environment variables, etc.

echo "Setup complete."