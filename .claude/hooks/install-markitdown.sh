#!/bin/bash
# Instala MarkItDown (https://github.com/microsoft/markitdown) al iniciar la sesión.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

if ! markitdown --help >/dev/null 2>&1; then
  pip install --quiet 'markitdown[all]'
  # El paquete cryptography del sistema falla con pdfminer; se reemplaza por la versión de pip.
  markitdown --help >/dev/null 2>&1 || pip install --quiet --ignore-installed cffi cryptography
fi

# ffmpeg permite convertir audio y video.
if ! command -v ffmpeg >/dev/null 2>&1; then
  (apt-get install -y -qq ffmpeg || (apt-get update -qq && apt-get install -y -qq ffmpeg)) >/dev/null 2>&1 || true
fi
