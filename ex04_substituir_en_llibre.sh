#!/bin/bash

# ==========================================
# EXERCICI 4 - Substituir paraules en un llibre
# Dificultat: mitjana
# Habilitats: paràmetres, sed, wc, fitxers, if
# ==========================================
#
# L'script ha de rebre 3 arguments:
#   $1 = fitxer d'origen   (ex: guerraDeLosMundos.txt)
#   $2 = paraula a buscar  (ex: Martian)
#   $3 = paraula nova      (ex: Alienígena)
#
# L'script ha de:
#   1. Comprovar que s'han passat exactament 3 arguments
#   2. Comprovar que el fitxer d'origen existeix
#   3. Comptar quantes vegades apareix la paraula original (grep + wc)
#   4. Crear un fitxer nou anomenat <original>_modificat.txt
#      amb totes les aparicions substituïdes (sed)
#   5. Confirmar quantes substitucions s'han fet al fitxer nou
#
# Exemple d'ús:
#   ./ex04_substituir_en_llibre.sh guerraDeLosMundos.txt Martian Alienígena
#
# Sortida esperada:
#   'Martian' apareix 187 vegades a l'original
#   Fitxer creat: guerraDeLosMundos_modificat.txt
#   'Alienígena' apareix 187 vegades al fitxer nou
# ==========================================


# Escriu el teu codi aquí:
