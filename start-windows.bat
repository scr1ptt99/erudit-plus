@echo off
chcp 65001 >nul
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js не найден. Установите его с https://nodejs.org и запустите файл снова.
  start https://nodejs.org
  pause
  exit /b
)
if not exist node_modules (
  echo Устанавливаю зависимости, это займёт минуту...
  call npm install
)
echo Запускаю сайт...
call npm run dev
pause
