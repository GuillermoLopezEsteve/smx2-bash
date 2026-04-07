#!/bin/bash

# ==========================================
# EXERCICI 3 - Monitor de serveis
# Dificultat: mitjana
# Habilitats: funcions, bucles, serveis, &&/||
# ==========================================
#
# L'script ha de:
#   1. Definir una funció "comprova_servei" que rep el nom d'un servei
#      i mostra si està actiu o aturat (com als exemples de 19_serveis)
#
#   2. Definir una llista de serveis a comprovar:
#      ssh, cron, ufw, apache2, mysql
#
#   3. Recórrer la llista amb un bucle i cridar la funció per a cada servei
#
#   4. Al final mostrar un resum:
#      "X serveis actius de Y totals"
#      (pista: necessitaràs un comptador que s'incrementi quan el servei estigui actiu)
#
# Sortida esperada:
#   [ ACTIU ] ssh
#   [ATURAT ] apache2
#   ...
#   Resum: 2 serveis actius de 5 totals
# ==========================================


# Escriu el teu codi aquí:
