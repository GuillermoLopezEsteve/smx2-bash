#!/bin/bash

# ==========================================
# EXERCICI 6 - Diagnosi de connectivitat
# Dificultat: difícil
# Habilitats: funcions, ping, nslookup, ip, &&/||, -z, exit
# ==========================================
#
# L'script ha de diagnosticar per què un client no té internet
# seguint aquests passos en ordre, aturant-se quan troba el problema:
#
#   PAS 1: Ping a google.com
#          -> OK:   "Tens internet" i sortir (exit 0)
#          -> FAIL: continuar al pas 2
#
#   PAS 2: Comprovar si el client té adreça IP
#          (pista: ip -4 addr show | grep inet | grep -v "127\.")
#          -> sense IP: "Sense IP, comprova cable/WiFi/DHCP" i sortir
#          -> té IP:    continuar al pas 3
#
#   PAS 3: nslookup google.com
#          -> OK:   "DNS funciona però no tens internet, possible problema de routing"  i sortir
#          -> FAIL: continuar al pas 4
#
#   PAS 4: Ping a la IP del servidor DNS
#          (pista: la IP del DNS es troba a /etc/resolv.conf, línia "nameserver X.X.X.X")
#          -> OK:   "El DNS respon però no resol noms, problema de configuració DNS" i sortir
#          -> FAIL: continuar al pas 5
#
#   PAS 5: Ping al gateway
#          (pista: ip route | grep "^default" dona la línia amb la IP del gateway)
#          -> OK:   "Arribes al router però no al DNS"
#          -> FAIL: "No arribes ni al router, problema de xarxa local"
#
# Notes:
#   - Usa les funcions success/warn/error per als missatges
#   - Usa -c 1 -W 3 als pings (1 paquet, 3 segons d'espera)
#   - Amaga l'output dels pings i nslookup amb > /dev/null 2>&1
#   - [ -z "$variable" ] comprova si una variable és buida
# ==========================================


# Escriu el teu codi aquí:
