#!/usr/bin/env bash
# Baixa a biblioteca MediaPipe e o modelo de gestos para a pasta vendor/,
# para o jogo funcionar na feira mesmo sem internet.
# Cada arquivo é baixado como .part e só é renomeado quando termina,
# então um download interrompido nunca deixa um arquivo quebrado.
set -e
cd "$(dirname "$0")"

CDN="https://cdn.jsdelivr.net/npm/@mediapipe/tasks-vision@1.0.1"
MODELO="https://storage.googleapis.com/mediapipe-models/gesture_recognizer/gesture_recognizer/float16/latest/gesture_recognizer.task"

baixar() {
  local url="$1" destino="$2"
  if [ -s "$destino" ]; then echo "✔ já existe: $destino"; return; fi
  mkdir -p "$(dirname "$destino")"
  echo "↓ baixando $destino"
  curl -fL --retry 5 -C - -o "$destino.part" "$url"
  mv "$destino.part" "$destino"
}

baixar "$CDN/vision_bundle.mjs"                   vendor/mediapipe/vision_bundle.mjs
baixar "$CDN/wasm/vision_wasm_internal.js"        vendor/mediapipe/wasm/vision_wasm_internal.js
baixar "$CDN/wasm/vision_wasm_internal.wasm"      vendor/mediapipe/wasm/vision_wasm_internal.wasm
baixar "$MODELO"                                  vendor/gesture_recognizer.task

echo "Pronto! O jogo agora funciona offline."
