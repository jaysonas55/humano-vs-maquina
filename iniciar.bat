@echo off
rem Sobe um servidor local e abre o jogo no navegador (Windows).
rem A webcam e a IA nao funcionam abrindo o index.html direto.
cd /d "%~dp0"

set PY=
where py >/dev/null 2>/dev/null && set PY=py
if not defined PY python --version >/dev/null 2>/dev/null && set PY=python
if not defined PY (
  echo Python nao encontrado. Instale com:  winget install Python.Python.3.12
  echo Depois feche e abra esta janela de novo.
  pause
  exit /b 1
)

start "" cmd /c "timeout /t 2 >/dev/null & start http://localhost:8000"
echo Jogo rodando em http://localhost:8000  -  feche esta janela para parar.
%PY% -m http.server 8000 --bind 127.0.0.1
pause
