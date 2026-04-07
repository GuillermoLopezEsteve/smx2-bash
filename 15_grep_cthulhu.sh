#!/bin/bash

# ==========================================
# GREP AL TEXT DE LA CRIDA DE CTHULHU
# Busquem R'lyeh - la ciutat submergida on dorm Cthulhu
# ==========================================

SCRIPT_DIR="$(dirname "$0")"
FITXER="$SCRIPT_DIR/chtulu.txt"

if [ ! -f "$FITXER" ]
then
    echo "ERROR: No trobo $FITXER"
    echo "Executa primer: ./12_descarregar_llibres.sh"
    exit 1
fi


echo "=== LA CRIDA DE CTHULHU - Estadístiques ==="
echo "Línies totals:   $(wc -l < "$FITXER")"
echo "Paraules totals: $(wc -w < "$FITXER")"
echo ""


# --- Buscar R'lyeh (la ciutat submergida) ---
echo "=== Totes les mencions de R'lyeh ==="
grep -n -i "r'lyeh" "$FITXER"
echo ""
echo "Total mencions de R'lyeh: $(grep -ci "r'lyeh" "$FITXER")"
echo ""


# --- Veure el context de R'lyeh ---
echo "=== Context quan es menciona R'lyeh (2 línies) ==="
grep -i -C 2 "r'lyeh" "$FITXER"
echo ""


# --- Buscar Cthulhu i els seus títols ---
echo "=== Mencions de 'Cthulhu' ==="
grep -c -i "cthulhu" "$FITXER"
echo "vegades apareix 'Cthulhu'"
echo ""

echo "=== El gran encanteri (el crit) ==="
grep -n -i "ph'nglui" "$FITXER"
# Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn
# = "A la seva casa de R'lyeh, el gran Cthulhu espera somiant"
echo ""


# --- Buscar els personatges principals ---
echo "=== Mencions de 'Johansen' (mariner protagonista) ==="
grep -n "Johansen" "$FITXER" | head -8
echo "Total: $(grep -c "Johansen" "$FITXER")"
echo ""


# --- Buscar paraules relacionades amb horror còsmic ---
echo "=== Vocabulari de l'horror còsmic ==="
for paraula in "horror" "madness" "nightmare" "ancient" "sunken"
do
    count=$(grep -oi "$paraula" "$FITXER" | wc -l)
    echo "  '$paraula' apareix $count vegades"
done
