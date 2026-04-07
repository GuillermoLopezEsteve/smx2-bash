#!/bin/bash

# ==========================================
# VARIABLES EN BASH
# ==========================================

# Crear una variable (sense espais al voltant del =)
nom="Anna"
edat=25

# Mostrar el valor d'una variable (amb $ davant)
echo "El meu nom és: $nom"
echo "La meva edat és: $edat"

# Variable amb text i número junts
missatge="Hola, tinc $edat anys"
echo $missatge

# Variable que guarda el resultat d'una comanda
data_actual=$(date)
echo "Avui és: $data_actual"

# Llegir una variable que l'usuari escriu pel teclat
echo "Escriu el teu nom:"
read nom_usuari
echo "Hola, $nom_usuari!"
