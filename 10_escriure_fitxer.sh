#!/bin/bash

# ==========================================
# ESCRIURE EN UN FITXER
# ==========================================

fitxer="/tmp/prova_escriptura.txt"

# Escriure (crea el fitxer o sobreescriu si ja existia)
echo "Primera línia" > $fitxer
echo "Fitxer creat/sobreescrit: $fitxer"

# Afegir al final del fitxer (sense esborrar el que hi havia)
echo "Segona línia" >> $fitxer
echo "Tercera línia" >> $fitxer

echo "Contingut del fitxer:"
cat $fitxer


# Escriure múltiples línies d'un cop
cat > /tmp/config_exemple.txt << 'EOF'
# Fitxer de configuració
servidor=localhost
port=3306
base_dades=escola
EOF

echo ""
echo "Fitxer de configuració creat:"
cat /tmp/config_exemple.txt


# Afegir la data actual al final d'un fitxer de registre (log)
fitxer_log="/tmp/registre.log"
echo "$(date) - Script executat" >> $fitxer_log
echo "$(date) - Tot ha anat bé"  >> $fitxer_log

echo ""
echo "Registre creat:"
cat $fitxer_log

# >   = sobreescriu el fitxer (esborra el contingut anterior)
# >>  = afegeix al final (no esborra res)
