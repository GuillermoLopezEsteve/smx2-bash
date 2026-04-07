#!/bin/bash

# ==========================================
# GREP AL TEXT DE LA GUERRA DELS MONS
# Busquem l'HMS Thunder Child - el vaixell que lluita contra els marcians
# ==========================================

SCRIPT_DIR="$(dirname "$0")"
FITXER="$SCRIPT_DIR/guerraDeLosMundos.txt"

if [ ! -f "$FITXER" ]
then
    echo "ERROR: No trobo $FITXER"
    echo "Executa primer: ./12_descarregar_llibres.sh"
    exit 1
fi


echo "=== LA GUERRA DELS MONS - Estadístiques ==="
echo "Línies totals:   $(wc -l < "$FITXER")"
echo "Paraules totals: $(wc -w < "$FITXER")"
echo ""


# --- Buscar l'HMS Thunder Child ---
echo "=== Totes les mencions de l'HMS Thunder Child ==="
grep -n -i "thunder child" "$FITXER"
echo ""
echo "Total mencions: $(grep -ci "thunder child" "$FITXER")"
echo ""


# --- Veure el context al voltant de la batalla (3 línies abans i després) ---
echo "=== Context de les mencions (3 línies de context) ==="
grep -i -A 3 -B 3 "thunder child" "$FITXER"
# -A 3 = mostrar 3 línies After  (després) de cada resultat
# -B 3 = mostrar 3 línies Before (abans)  de cada resultat
# -C 3 = after + before alhora (shortcut)
echo ""


# --- Buscar altres elements de la batalla naval ---
echo "=== Mencions de 'ironclad' (cuirassat) ==="
grep -n -i "ironclad" "$FITXER" | head -8
echo "Total: $(grep -ci "ironclad" "$FITXER")"
echo ""

echo "=== Mencions de 'Martian' ==="
grep -c -i "martian" "$FITXER"
echo "vegades apareix 'Martian'"
echo ""


# --- Buscar el capítol on apareix el Thunder Child ---
echo "=== Capítols que mencionen el Thunder Child ==="
grep -n -i "chapter\|thunder child" "$FITXER" | grep -B 5 -i "thunder child" | grep -i "chapter"
# Encadenem dos grep amb | (pipe) per filtrar els resultats
