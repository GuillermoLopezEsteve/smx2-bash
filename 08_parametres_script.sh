#!/bin/bash

# ==========================================
# PARÀMETRES QUE REP L'SCRIPT
# ==========================================

# Quan executes:  ./script.sh hola 42 fitxer.txt
#   $0 = nom de l'script  (./script.sh)
#   $1 = primer argument  (hola)
#   $2 = segon argument   (42)
#   $3 = tercer argument  (fitxer.txt)
#   $# = quants arguments han arribat  (3)

echo "Nom de l'script: $0"
echo "Primer argument: $1"
echo "Segon argument:  $2"
echo "Quants arguments: $#"


# Comprovar que l'usuari ha passat els arguments necessaris
if [ $# -eq 0 ]
then
    echo "ERROR: Cal passar almenys un argument"
    echo "Ús: $0 <nom>"
    exit 1
fi


# Exemple pràctic: script que saluda pel nom
nom="$1"
echo "Hola, $nom!"


# Comprovar que s'han passat exactament 2 arguments
comprova_dos_arguments() {
    if [ $# -ne 2 ]
    then
        echo "Necessito exactament 2 arguments"
        return 1
    fi
    echo "Argument 1: $1"
    echo "Argument 2: $2"
}

comprova_dos_arguments "primer" "segon"
