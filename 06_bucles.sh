#!/bin/bash

# ==========================================
# BUCLES: REPETIR COSES
# ==========================================


# --- BUCLE FOR: repetir un número fix de vegades ---

echo "--- Bucle for amb números ---"
for numero in 1 2 3 4 5
do
    echo "Número: $numero"
done


echo "--- Bucle for amb rang ---"
for numero in $(seq 1 5)
do
    echo "Número: $numero"
done

# seq 1 5 = genera els números de l'1 al 5


echo "--- Bucle for amb fitxers ---"
for fitxer in /tmp/*.sh
do
    echo "Fitxer trobat: $fitxer"
done


echo "--- Bucle for amb una llista de textos ---"
for fruita in poma pera taronja maduixa
do
    echo "Fruita: $fruita"
done


# --- BUCLE WHILE: repetir mentre una condició sigui certa ---

echo "--- Bucle while ---"
comptador=1

while [ $comptador -le 3 ]
do
    echo "Volta número: $comptador"
    comptador=$((comptador + 1))
done

# $((  )) = fer operacions matemàtiques
# -le = less or equal (menor o igual)
