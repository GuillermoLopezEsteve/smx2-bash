#!/bin/bash

# ==========================================
# EXERCICI 1 - Còpia de seguretat d'un fitxer
# Dificultat: fàcil
# Habilitats: variables, if, fitxers, &&/||
# ==========================================
#
# L'script ha de:
#   1. Rebre el nom d'un fitxer com a argument ($1)
#   2. Comprovar que s'ha passat un argument, si no -> mostrar error i sortir
#   3. Comprovar que el fitxer existeix, si no -> mostrar error i sortir
#   4. Copiar el fitxer afegint l'extensió .bak  (ex: fitxer.txt -> fitxer.txt.bak)
#   5. Comprovar si la còpia s'ha fet bé amb && i || i mostrar el missatge adequat
#
# Exemple d'ús:
#   ./ex01_fitxer_backup.sh /etc/hostname
#
# Sortida esperada:
#   [  OK  ] Còpia creada: /etc/hostname.bak
# ==========================================


# Escriu el teu codi aquí:
