# Instrucciones

## Conversión de archivos con MarkItDown

Cuando el usuario pida convertir o leer un archivo PDF, Word (.docx), Excel (.xlsx/.xls),
PowerPoint (.pptx), imagen, audio o video, conviértelo primero a Markdown con
[MarkItDown](https://github.com/microsoft/markitdown) y luego lee el resultado:

```bash
markitdown ruta/al/archivo.pdf -o ruta/al/archivo.md
```

- Si `markitdown` no está instalado, ejecuta `.claude/hooks/install-markitdown.sh`
  (en sesiones remotas se instala automáticamente al iniciar).
- Guarda el `.md` junto al original salvo que el usuario indique otra ubicación.
