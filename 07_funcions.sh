#!/bin/bash

# ==========================================
# FUNCIONS: AGRUPAR CODI PER REUTILITZAR-LO
# ==========================================

# Definir una funció (cal definir-la ABANS d'usar-la)
saluda() {
    echo "Hola a tothom!"
}

# Cridar la funció
saluda


# Funció amb paràmetres ($1 = primer argument, $2 = segon, ...)
saluda_persona() {
    echo "Hola, $1!"
}

saluda_persona "Maria"
saluda_persona "Joan"


# Funció que fa una tasca útil
comprova_fitxer() {
    if [ -f "$1" ]
    then
        echo "El fitxer '$1' existeix"
    else
        echo "El fitxer '$1' no existeix"
    fi
}

comprova_fitxer "/etc/hostname"
comprova_fitxer "/fitxer/inventat.txt"


# Funció que retorna un valor (0 = èxit, 1 = error)
es_numero_positiu() {
    if [ "$1" -gt 0 ]
    then
        return 0
    else
        return 1
    fi
}

es_numero_positiu 5
if [ $? -eq 0 ]
then
    echo "5 és positiu"
fi

# $? = resultat de l'última comanda (0 = correcte, altres = error)
