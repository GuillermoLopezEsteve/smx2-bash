#!/bin/bash

# ==========================================
# CODIS DE RESPOSTA HTTP AMB curl
#
# 2XX = Èxit        (la petició ha funcionat)
# 3XX = Redirecció  (el servidor t'envia a un altre lloc)
# 4XX = Error client (tu has fet alguna cosa malament)
# 5XX = Error servidor (el servidor ha fallat)
# ==========================================


# curl -s  = silent (no mostra la barra de progrés)
# curl -o  = desa la resposta en un fitxer (aquí /dev/null = no la volem)
# curl -w  = write-out (mostra informació extra, com el codi de resposta)
# curl -L  = segueix les redireccions automàticament
# curl -I  = mostra només les capçaleres HTTP (HEAD request)
# curl -m  = temps màxim d'espera en segons


# ==========================================
# Funció per obtenir el codi HTTP d'una URL
# ==========================================

obte_codi_http() {
    local url="$1"
    local codi

    codi=$(curl -s -o /dev/null -w "%{http_code}" -m 10 "$url")
    echo "$codi"
}

# Funció per explicar el codi
explica_codi() {
    local codi="$1"
    local primer_digit="${codi:0:1}"     # agafem el primer caràcter

    case $primer_digit in
        2) echo "2XX - ÈXIT: La petició ha funcionat correctament" ;;
        3) echo "3XX - REDIRECCIÓ: El servidor t'envia a un altre lloc" ;;
        4) echo "4XX - ERROR CLIENT: Hi ha un problema amb la petició" ;;
        5) echo "5XX - ERROR SERVIDOR: El servidor ha fallat" ;;
        *) echo "Codi desconegut o no s'ha pogut connectar (000 = sense connexió)" ;;
    esac
}

# case = equivalent a if/elif però per valors concrets (com switch en altres idiomes)
# ${variable:0:1} = agafar 1 caràcter a partir de la posició 0


# ==========================================
# 2XX - ÈXIT
# ==========================================

echo "=============================="
echo "2XX - PETICIONS AMB ÈXIT"
echo "=============================="
echo ""

# 200 OK - la pàgina existeix i es retorna correctament
url="https://www.google.com"
codi=$(obte_codi_http "$url")
echo "URL: $url"
echo "Codi: $codi"
explica_codi "$codi"
echo "  200 = OK, la pàgina s'ha retornat correctament"
echo ""

# Veure les capçaleres completes d'una resposta 200
echo "--- Capçaleres HTTP de google.com ---"
curl -s -I -m 10 "https://www.google.com" | head -10
echo ""


# ==========================================
# 3XX - REDIRECCIÓ
# ==========================================

echo "=============================="
echo "3XX - REDIRECCIONS"
echo "=============================="
echo ""

# 301 Moved Permanently - google.com (http) redirigeix a https
url="http://www.google.com"
codi=$(obte_codi_http "$url")
echo "URL: $url"
echo "Codi: $codi"
explica_codi "$codi"
echo "  301 = Mogut permanentment (redirigeix a https://)"
echo ""

# Veure la capçalera Location (on redirigeix)
echo "--- On redirigeix? (capçalera Location) ---"
curl -s -I -m 10 "http://www.google.com" | grep -i "location\|HTTP/"
echo ""

# Veure la redirecció pas a pas (-L segueix la redirecció, -v verbose)
echo "--- Seguint la redirecció amb -L ---"
codi_final=$(curl -s -o /dev/null -w "%{http_code}" -L -m 10 "http://www.google.com")
echo "Codi final (après seguir la redirecció): $codi_final"
echo ""


# ==========================================
# 4XX - ERRORS DEL CLIENT
# ==========================================

echo "=============================="
echo "4XX - ERRORS DEL CLIENT"
echo "=============================="
echo ""

# 404 Not Found - la pàgina no existeix
url="https://www.google.com/pagina-que-no-existeix-xyz123"
codi=$(obte_codi_http "$url")
echo "URL: $url"
echo "Codi: $codi"
explica_codi "$codi"
echo "  404 = Not Found, la pàgina no existeix"
echo ""

# 400 Bad Request - petició malformada (enviem caràcters il·legals)
url="https://www.google.com/search?q=[]test"
codi=$(obte_codi_http "$url")
echo "URL: $url"
echo "Codi: $codi"
explica_codi "$codi"
echo "  400 = Bad Request, la petició té errors de format"
echo ""


# ==========================================
# Resum de múltiples URLs
# ==========================================

echo "=============================="
echo "RESUM - COMPROVACIÓ DE MÚLTIPLES URLs"
echo "=============================="
echo ""

declare -A urls_a_comprovar
# declare -A = crear un array associatiu (clau => valor)

urls_a_comprovar["google.com (https)"]="https://www.google.com"
urls_a_comprovar["google.com (http redirigeix)"]="http://www.google.com"
urls_a_comprovar["pàgina inexistent (404)"]="https://www.google.com/xyzabc404"

for descripció in "${!urls_a_comprovar[@]}"
do
    url="${urls_a_comprovar[$descripció]}"
    codi=$(obte_codi_http "$url")
    printf "  %-35s -> Codi: %s\n" "$descripció" "$codi"
done

# printf = com echo però amb format
# %-35s = text alineat a l'esquerra amb 35 caràcters d'amplada
# ${!array[@]} = agafa les CLAUS de l'array (no els valors)
