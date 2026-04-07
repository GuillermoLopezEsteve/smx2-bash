#!/bin/bash

# ==========================================
# COMPROVAR LA XARXA
# ==========================================

success() { echo "[  OK  ] $1"; }
warn()    { echo "[ WARN ] $1"; }
error()   { echo "[ ERROR] $1"; }
fail()    { echo "[ FAIL ] $1"; exit 1; }


# ==========================================
# PING - comprovar si una màquina respon
# ==========================================

echo "=== PING ==="
echo ""

# Fer un ping simple (1 paquet, màxim 3 segons d'espera)
host="8.8.8.8"

if ping -c 1 -W 3 "$host" > /dev/null 2>&1
then
    success "La màquina $host RESPON"
else
    error "La màquina $host NO respon"
fi

# ping -c 1 = enviar només 1 paquet
# ping -W 3 = esperar màxim 3 segons
# > /dev/null 2>&1 = amagar tot l'output (stdout i stderr)


# Comprovar si tenim connexió a internet
echo ""
if ping -c 1 -W 3 "8.8.8.8" > /dev/null 2>&1
then
    success "Tenim connexió a internet"
else
    fail "No tenim connexió a internet"
fi


# Comprovar múltiples hosts
echo ""
echo "=== PING A MÚLTIPLES HOSTS ==="

for host in "8.8.8.8" "1.1.1.1" "192.168.1.1" "google.com"
do
    if ping -c 1 -W 2 "$host" > /dev/null 2>&1
    then
        echo "  [ OK ] $host respon"
    else
        echo "  [FAIL] $host no respon"
    fi
done


# ==========================================
# PORTS - comprovar si un port està obert
# ==========================================

echo ""
echo "=== COMPROVAR PORTS OBERTS ==="
echo ""

# nc (netcat) -z = comprova si el port és obert sense enviar dades
# nc -w 2 = esperar màxim 2 segons

comprova_port() {
    local host="$1"
    local port="$2"

    if nc -z -w 2 "$host" "$port" 2>/dev/null
    then
        success "Port $port obert a $host"
    else
        warn "Port $port tancat a $host"
    fi
}

comprova_port "google.com" 80    # HTTP
comprova_port "google.com" 443   # HTTPS
comprova_port "localhost"  22    # SSH
comprova_port "localhost"  3306  # MySQL


# ==========================================
# INFORMACIÓ DE LA XARXA LOCAL
# ==========================================

echo ""
echo "=== INFORMACIÓ DE LA XARXA LOCAL ==="
echo ""

# Mostrar les IPs de les interfícies de xarxa
echo "Adreces IP del sistema:"
ip -4 addr show | grep inet | awk '{print "  " $2 "  (" $NF ")"}'
# ip addr show = mostra totes les interfícies
# grep inet = filtrar les línies amb adreça IPv4
# awk $2 = la IP, $NF = el nom de la interfície (últim camp)

echo ""

# Mostrar la porta d'enllaç (gateway)
echo "Porta d'enllaç (gateway):"
ip route | grep default | awk '{print "  " $3}'
