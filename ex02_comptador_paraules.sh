#!/bin/bash

# ==========================================
# EXERCICI 2 - Comptador de paraules en un llibre
# Dificultat: mitjana
# Habilitats: variables, grep, wc, bucles, paràmetres
# ==========================================
#
# L'script ha de:
#   1. Rebre el path d'un fitxer de text com a argument ($1)
#   2. Comprovar que el fitxer existeix
#   3. Mostrar les estadístiques bàsiques del fitxer (línies, paraules, )
#   4. Demanar a l'usuari que escrigui una paraula a buscar (read)
#   5. Buscar quantes vegades apareix aquella paraula (sense distingir majúscules)
#   6. Mostrar les 3 primeres línies on apareix (amb número de línia)
#
# Exemple d'ús:
#   ./ex02_comptador_paraules.sh dracula.txt
#
# Sortida esperada:
#   Línies: 9512  Paraules: 164424  Caràcters: 881897
#   Quina paraula vols buscar? vampire
#   'vampire' apareix 21 vegades
#   Primeres línies:
#   1234: The vampire was there...
# ==========================================


# Escriu el teu codi aquí:
