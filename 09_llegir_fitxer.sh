#!/bin/bash

# ==========================================
# LLEGIR EL CONTINGUT D'UN FITXER
# ==========================================

# Primer creem un fitxer d'exemple
cat > /tmp/fruites.txt << 'EOF'
poma
pera
taronja
maduixa
pastanaga
plàtan
patata
EOF

echo "Fitxer creat: /tmp/fruites.txt"
echo ""


# Llegir un fitxer línia per línia
echo "--- Llegint línia per línia ---"
while read linia
do
    echo "Fruita: $linia"
done < /tmp/fruites.txt

# < fitxer = llegir des d'un fitxer (en comptes del teclat)


# Mostrar tot el contingut d'un fitxer
echo ""
echo "--- Tot el contingut ---"
cat /tmp/fruites.txt


# Comptar quantes línies té un fitxer
num_linies=$(wc -l < /tmp/fruites.txt)
echo ""
echo "El fitxer té $num_linies línies"


# Buscar una paraula dins un fitxer
echo ""
if grep -q "poma" /tmp/fruites.txt
then
    echo "La paraula 'poma' ES troba al fitxer"
else
    echo "La paraula 'poma' NO es troba al fitxer"
fi
