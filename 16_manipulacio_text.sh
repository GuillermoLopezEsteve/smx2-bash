#!/bin/bash

# ==========================================
# MANIPULACIÓ DE TEXT: sed, tr, wc, cut, sort
# ==========================================

FITXER="/tmp/llibres/war_of_worlds.txt"

# Creem un fitxer petit per fer proves clares
cat > /tmp/prova_text.txt << 'EOF'
El monstre és gran i el monstre és fort.
El monstre camina pel carrer.
La gent té por del monstre.
El monstre no para de creixer.
EOF


# ==========================================
# sed = stream editor, modifica text
# ==========================================

echo "=== SUBSTITUIR PARAULES AMB sed ==="
echo ""

echo "--- Text original ---"
cat /tmp/prova_text.txt
echo ""

# Substituir la primera aparició per línia
echo "--- Substituir 'monstre' per 'robot' (primera aparició) ---"
sed 's/monstre/robot/' /tmp/prova_text.txt
echo ""

# Substituir TOTES les aparicions per línia (flag g = global)
echo "--- Substituir 'monstre' per 'robot' (totes les aparicions) ---"
sed 's/monstre/robot/g' /tmp/prova_text.txt
echo ""

# Substituir sense distingir majúscules (flag i = insensible)
echo "--- Substituir 'el' per 'UN' (sense distingir majúscules) ---"
sed 's/el/UN/gi' /tmp/prova_text.txt
echo ""

# Guardar el resultat en un fitxer nou
echo "--- Guardar resultat en fitxer nou ---"
sed 's/monstre/CRIATURA/g' /tmp/prova_text.txt > /tmp/text_modificat.txt
echo "Fitxer guardat. Contingut:"
cat /tmp/text_modificat.txt
echo ""

# Modificar el fitxer DIRECTAMENT (flag -i = in-place)
echo "--- Modificar el fitxer directament (sed -i) ---"
cp /tmp/prova_text.txt /tmp/prova_copia.txt
sed -i 's/monstre/bèstia/g' /tmp/prova_copia.txt
echo "Fitxer modificat directament:"
cat /tmp/prova_copia.txt
echo ""


# ==========================================
# Substituir en un llibre real
# ==========================================

if [ -f "$FITXER" ]
then
    echo "=== SUBSTITUIR EN WAR OF THE WORLDS ==="

    # Comptar quantes vegades apareix 'Martian' abans
    echo "Aparicions de 'Martian' original: $(grep -oi "Martian" "$FITXER" | wc -l)"

    # Crear versió modificada on els marcians es diuen 'Alienígena'
    sed 's/Martian/Alienigena/g; s/martian/alienigena/g' "$FITXER" > /tmp/war_modificat.txt

    echo "Aparicions de 'Alienigena' al nou fitxer: $(grep -oi "Alienigena" /tmp/war_modificat.txt | wc -l)"
    echo ""
fi


# ==========================================
# wc = word count (compta paraules, línies, caràcters)
# ==========================================

echo "=== COMPTAR AMB wc ==="
echo ""

echo "--- Informació del fitxer de prova ---"
wc /tmp/prova_text.txt
#  output: línies  paraules  caràcters  nom_fitxer
echo ""

echo "--- Només línies (-l) ---"
wc -l /tmp/prova_text.txt

echo "--- Només paraules (-w) ---"
wc -w /tmp/prova_text.txt

echo "--- Només caràcters (-c) ---"
wc -c /tmp/prova_text.txt
echo ""

if [ -f "$FITXER" ]
then
    echo "--- Estadístiques de War of the Worlds ---"
    echo "  Línies:    $(wc -l < "$FITXER")"
    echo "  Paraules:  $(wc -w < "$FITXER")"
    echo "  Caràcters: $(wc -c < "$FITXER")"
fi


# ==========================================
# tr = translate (transforma caràcters)
# ==========================================

echo ""
echo "=== TRANSFORMAR TEXT AMB tr ==="

# Convertir a majúscules
echo "hola món" | tr 'a-z' 'A-Z'

# Convertir a minúscules
echo "HOLA MÓN" | tr 'A-Z' 'a-z'

# Eliminar caràcters concrets (-d = delete)
echo "h-o-l-a m-ó-n" | tr -d '-'


# ==========================================
# sort i uniq = ordenar i eliminar duplicats
# ==========================================

echo ""
echo "=== ORDENAR I ELIMINAR DUPLICATS ==="

cat > /tmp/llista.txt << 'EOF'
taronja
poma
pera
poma
taronja
maduixa
pera
poma
EOF

echo "--- Llista original ---"
cat /tmp/llista.txt

echo "--- Ordenada alfabèticament ---"
sort /tmp/llista.txt

echo "--- Sense duplicats (cal ordenar primer) ---"
sort /tmp/llista.txt | uniq

echo "--- Quantes vegades apareix cada element ---"
sort /tmp/llista.txt | uniq -c | sort -rn
# uniq -c = compta repeticions
# sort -rn = ordena de major a menor (-r reverse, -n numèric)
