#!/bin/bash

# ==========================================
# COMPROVAR SI UN USUARI EXISTEIX AL SISTEMA
# ==========================================

nom_usuari="root"

# Manera 1: buscar l'usuari al fitxer /etc/passwd
if grep -q "^$nom_usuari:" /etc/passwd
then
    echo "L'usuari '$nom_usuari' EXISTEIX"
else
    echo "L'usuari '$nom_usuari' NO existeix"
fi

# grep -q = busca sense mostrar res, només retorna cert o fals
# ^  = significa "comença per"
# :  = el nom d'usuari acaba amb dos punts a /etc/passwd


# Manera 2: usar la comanda id
if id "$nom_usuari" &>/dev/null
then
    echo "L'usuari '$nom_usuari' existeix (comprovat amb id)"
else
    echo "L'usuari '$nom_usuari' no existeix (comprovat amb id)"
fi

# &>/dev/null = amaga qualsevol missatge de la comanda


# Comprovar si l'usuari actual és root
if [ "$EUID" -eq 0 ]
then
    echo "Estàs executant l'script com a root (administrador)"
else
    echo "No ets root. Usuari actual: $USER"
fi

# $EUID = ID de l'usuari actual (root sempre és 0)
# $USER = nom de l'usuari actual
