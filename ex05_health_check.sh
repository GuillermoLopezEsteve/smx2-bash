#!/bin/bash

# ==========================================
# EXERCICI 5 - Health check del sistema
# Dificultat: difícil
# Habilitats: tot barrejat - funcions, serveis, xarxa, fitxers, bucles, &&/||
# ==========================================
#
# Crea un script que faci un "health check" complet del sistema
# i generi un informe en un fitxer de text.
#
# L'script ha de comprovar i guardar en /tmp/health_report.txt:
#
#   1. XARXA
#      - Si hi ha connexió a internet (ping a 8.8.8.8)
#      - Si el port 80 i 443 de google.com estan oberts
#
#   2. SERVEIS
#      - Si ssh i cron estan corrent
#
#   3. DISC
#      - Si algun sistema de fitxers supera el 80% d'ús
#        (pista: df -h | grep -v tmpfs | awk '{print $5}' dona els percentatges)
#        (pista: el % s'ha de treure amb tr -d '%' per poder comparar com a número)
#
#   4. USUARI
#      - Si l'script s'està executant com a root o no
#
# Format del fitxer de sortida:
#   ============================
#   HEALTH CHECK - <data i hora>
#   ============================
#   [  OK  ] Connexió a internet
#   [ FAIL ] SSH no està corrent
#   [ WARN ] Disc / al 85% de capacitat
#   ...
#   ============================
#   Resultat: X checks OK, Y warnings, Z errors
#
# Pistes:
#   - Usa les funcions success/warn/error per escriure els missatges
#   - Per escriure al fitxer i a la pantalla alhora: usa 'tee -a fitxer'
#     ex: echo "missatge" | tee -a /tmp/health_report.txt
#   - Porta comptadors per a ok, warn i error
# ==========================================


# Escriu el teu codi aquí:
