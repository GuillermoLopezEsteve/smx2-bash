#!/bin/bash

# ==========================================
# COMPROVAR SI UN FITXER O CARPETA EXISTEIX
# ==========================================

fitxer="/etc/hostname"
carpeta="/etc"

# Comprovar si un fitxer existeix
if [ -f "$fitxer" ]
then
    echo "El fitxer $fitxer EXISTEIX"
else
    echo "El fitxer $fitxer NO existeix"
fi

# Comprovar si una carpeta existeix
if [ -d "$carpeta" ]
then
    echo "La carpeta $carpeta EXISTEIX"
else
    echo "La carpeta $carpeta NO existeix"
fi

# Comprovar si un fitxer NO existeix (! = negació)
if [ ! -f "/tmp/fitxer_inventat.txt" ]
then
    echo "Aquest fitxer no existeix, el creo ara"
    touch /tmp/fitxer_inventat.txt
    echo "Fitxer creat!"
fi

# Comprovar si el fitxer té contingut (no està buit)
if [ -s "$fitxer" ]
then
    echo "El fitxer té contingut"
else
    echo "El fitxer està buit"
fi

# Resum de les comprovacions més útils:
# -f  = és un fitxer normal
# -d  = és una carpeta (directory)
# -e  = existeix (fitxer o carpeta)
# -s  = existeix i té contingut (not empty)
# -r  = es pot llegir (readable)
# -w  = es pot escriure (writable)
# -x  = es pot executar (executable)
