@echo off
echo Starting SecureLearn Desktop Application...
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check if Electron is installed
if not exist node_modules\electron (
    echo Installing Electron dependencies...
    npm install
)

REM Start the desktop application
echo Starting SecureLearn Professional Desktop...
node run-desktop.js

pause