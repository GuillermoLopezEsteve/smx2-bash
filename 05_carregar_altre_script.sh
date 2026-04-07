#!/bin/bash

# ==========================================
# CARREGAR (IMPORTAR) UN ALTRE FITXER BASH
# ==========================================

# Primer creem un fitxer amb variables i funcions compartides
cat > /tmp/configuracio.sh << 'EOF'
# Aquest fitxer conté configuració compartida
servidor="192.168.1.1"
port=8080
nom_app="La Meva App"

saluda() {
    echo "Hola des de la configuració!"
}
EOF

echo "Fitxer de configuració creat a /tmp/configuracio.sh"


# Carregar el fitxer extern amb 'source' o amb el punt '.'
# Les dues maneres fan exactament el mateix:

source /tmp/configuracio.sh
# . /tmp/configuracio.sh    <- aquesta manera també funciona


# Ara podem usar les variables i funcions del fitxer carregat
echo "Servidor: $servidor"
echo "Port: $port"
echo "Aplicació: $nom_app"
saluda


# Bona pràctica: comprovar que el fitxer existeix abans de carregar-lo
fitxer_config="/tmp/configuracio.sh"

if [ -f "$fitxer_config" ]
then
    source "$fitxer_config"
    echo "Configuració carregada correctament"
else
    echo "ERROR: No s'ha trobat el fitxer $fitxer_config"
    exit 1
fi

# exit 1 = sortir de l'script amb error
# exit 0 = sortir de l'script sense error (tot bé)
