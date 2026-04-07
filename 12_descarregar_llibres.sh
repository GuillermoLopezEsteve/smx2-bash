#!/bin/bash

# ==========================================
# DESCARREGAR ELS LLIBRES DEL PROJECTE GUTENBERG
# Executa aquest script primer abans dels altres de grep
# ==========================================

# Guardem la carpeta on està aquest script
# Així els fitxers es descarreguen sempre al costat de l'script
SCRIPT_DIR="$(dirname "$0")"

# Descarreguem els tres llibres a la mateixa carpeta que l'script
# curl <url> -o <nom_fitxer>
curl https://www.gutenberg.org/cache/epub/42324/pg42324.txt -o "$SCRIPT_DIR/Frankestein.txt"
curl https://www.gutenberg.org/cache/epub/36/pg36.txt       -o "$SCRIPT_DIR/guerraDeLosMundos.txt"
curl https://www.gutenberg.org/cache/epub/68283/pg68283.txt -o "$SCRIPT_DIR/chtulu.txt"
curl https://www.gutenberg.org/cache/epub/345/pg345.txt    -o "$SCRIPT_DIR/Dracula.txt"

# EXERCICI: Fes que cada curl només s'executi si el fitxer encara no existeix
