@echo off
start "CMD 1" /min cmd /k "npm run dev"
timeout /t 2
start "CMD 1" cmd /c "start http://localhost:5173/"