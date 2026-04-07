#!/bin/bash

# ==========================================
# GREP AL TEXT DE FRANKENSTEIN
# ==========================================

SCRIPT_DIR="$(dirname "$0")"
FITXER="$SCRIPT_DIR/Frankestein.txt"

# Comprovar que el fitxer existeix (executa primer 12_descarregar_llibres.sh)
if [ ! -f "$FITXER" ]
then
    echo "ERROR: No trobo $FITXER"
    echo "Executa primer: ./12_descarregar_llibres.sh"
    exit 1
fi


# --- Informació bàsica del llibre ---
echo "=== FRANKENSTEIN - Estadístiques ==="
echo "Línies totals:   $(wc -l < "$FITXER")"
echo "Paraules totals: $(wc -w < "$FITXER")"
echo ""


# --- Buscar una paraula (sensible a majúscules) ---
echo "=== Línies que contenen 'monster' ==="
grep "monster" "$FITXER" | head -5
# head -5 = mostrar només les 5 primeres línies trobades
echo "..."
echo "Total: $(grep -c "monster" "$FITXER") vegades"
echo ""


# --- Buscar sense distingir majúscules/minúscules (-i) ---
echo "=== Línies amb 'god' (amb o sense majúscules) ==="
grep -i "god" "$FITXER" | head -5
echo "..."
echo "Total: $(grep -ci "god" "$FITXER") vegades"
echo ""


# --- Buscar i mostrar el número de línia (-n) ---
echo "=== Línies on apareix 'Frankenstein' (amb número de línia) ==="
grep -n "Frankenstein" "$FITXER" | head -5
echo ""


# --- Buscar una frase exacta ---
echo "=== Línies que contenen 'the secrets of heaven' ==="
grep -i "the secrets of heaven" "$FITXER"
echo ""

