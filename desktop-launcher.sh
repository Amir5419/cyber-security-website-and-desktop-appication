#!/bin/bash

echo "Starting SecureLearn Desktop Application..."
echo

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Error: Node.js is not installed or not in PATH"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

# Check if Electron is installed
if [ ! -d "node_modules/electron" ]; then
    echo "Installing Electron dependencies..."
    npm install
fi

# Start the desktop application
echo "Starting SecureLearn Professional Desktop..."
node run-desktop.js