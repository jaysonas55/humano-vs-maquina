#!/usr/bin/env bash
# Sobe um servidor local e abre o jogo no navegador.
# (A webcam e a IA não funcionam abrindo o arquivo direto com duplo clique.)
cd "$(dirname "$0")"
PORTA=8000
(sleep 1 && xdg-open "http://localhost:$PORTA" >/dev/null 2>&1) &
echo "Jogo rodando em http://localhost:$PORTA  (Ctrl+C para parar)"
python3 -m http.server "$PORTA"
