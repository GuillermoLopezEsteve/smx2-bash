#!/bin/bash

# ==========================================
# COMANDES ÚTILS DEL DIA A DIA
# ==========================================

# --- Data i hora ---
echo "Data actual:      $(date +%d/%m/%Y)"
echo "Hora actual:      $(date +%H:%M:%S)"
echo "Data i hora:      $(date '+%d/%m/%Y %H:%M')"


# --- Informació del sistema ---
echo ""
echo "Usuari actual:    $USER"
echo "Carpeta actual:   $(pwd)"
echo "Nom del servidor: $(hostname)"


# --- Comprovar si una comanda existeix ---
if command -v git &>/dev/null
then
    echo "Git està instal·lat: $(git --version)"
else
    echo "Git NO està instal·lat"
fi


# --- Esperar X segons ---
echo ""
echo "Esperant 2 segons..."
sleep 2
echo "Ja han passat 2 segons!"


# --- Mostrar missatges de colors ---
VERMELL='\033[0;31m'
VERD='\033[0;32m'
GROC='\033[1;33m'
RESET='\033[0m'

echo ""
echo -e "${VERD}Aquest missatge és verd${RESET}"
echo -e "${VERMELL}Aquest missatge és vermell (error)${RESET}"
echo -e "${GROC}Aquest missatge és groc (avís)${RESET}"

# -e = permet interpretar els codis de color
