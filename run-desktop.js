#!/usr/bin/env node

const { spawn } = require('child_process');
const path = require('path');

console.log('🚀 Starting SecureLearn Desktop Application...');

// Start the desktop application
const electronProcess = spawn('electron', ['public/electron.js'], {
  stdio: 'inherit',
  env: {
    ...process.env,
    NODE_ENV: 'desktop'
  }
});

electronProcess.on('error', (error) => {
  console.error('Failed to start Electron:', error);
  process.exit(1);
});

electronProcess.on('exit', (code) => {
  console.log(`Electron process exited with code ${code}`);
  process.exit(code);
});

// Handle graceful shutdown
process.on('SIGINT', () => {
  console.log('\n🛑 Shutting down SecureLearn Desktop...');
  electronProcess.kill('SIGTERM');
});

process.on('SIGTERM', () => {
  electronProcess.kill('SIGTERM');
});