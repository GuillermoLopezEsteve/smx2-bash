#!/bin/bash

# ==========================================
# CONDICIONS: SI / SINO (if / else)
# ==========================================

edat=20

# Comprovar si un número és més gran que un altre
if [ $edat -gt 18 ]
then
    echo "Ets major d'edat"
else
    echo "Ets menor d'edat"
fi

# -gt = greater than (més gran que)
# -lt = less than (més petit que)
# -eq = equal (igual)
# -ne = not equal (diferent)
# -ge = greater or equal (més gran o igual)
# -le = less or equal (més petit o igual)


# Comprovar si dos textos són iguals
color="blau"

if [ "$color" = "blau" ]
then
    echo "El color és blau"
elif [ "$color" = "vermell" ]
then
    echo "El color és vermell"
else
    echo "No sé quin color és"
fi

# elif = sino si (per afegir més condicions)
