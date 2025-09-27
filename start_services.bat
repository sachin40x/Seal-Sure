@echo off
echo Starting SealSure Services...

echo Starting Backend Server...
start "Backend" cmd /k "cd backend && npm start"

echo Starting Frontend Server...
start "Frontend" cmd /k "cd frontend && npm run dev"

echo Starting Python Flask Service...
start "Python Service" cmd /k "cd Python_Flask_FastApi/Code && python bank_statement.py"

echo All services started!
echo Backend: http://localhost:5000
echo Frontend: http://localhost:5173
echo Python Service: http://localhost:5001

pause
