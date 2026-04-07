#!/bin/bash

# ==========================================
# AGAFAR LA PARAULA N D'UNA LÍNIA
# i combinar-ho amb grep
# ==========================================

# awk '{print $N}' = agafa la paraula número N d'una línia
# Les paraules es compten des de $1
# $1 = primera paraula, $2 = segona, $NF = l'última (sigui quina sigui)


# ==========================================
# EXEMPLES BÀSICS AMB awk
# ==========================================

echo "=== AGAFAR PARAULA N AMB awk ==="
echo ""

linia="el gat gros seu damunt la taula"

echo "Línia: $linia"
echo ""

echo "Paraula 1: $(echo "$linia" | awk '{print $1}')"
echo "Paraula 2: $(echo "$linia" | awk '{print $2}')"
echo "Paraula 4: $(echo "$linia" | awk '{print $4}')"
echo "Última:    $(echo "$linia" | awk '{print $NF}')"
echo ""


# ==========================================
# EXEMPLES PRÀCTICS AMB FITXERS DEL SISTEMA
# ==========================================

echo "=== EXEMPLE: Usuaris del sistema ==="
echo ""

# /etc/passwd té línies com: root:x:0:0:root:/root:/bin/bash
# Els camps estan separats per : no per espais
# awk -F: = usar : com a separador de camps

echo "Nom d'usuari (camp 1) i shell (camp 7) de cada usuari:"
grep "/bin/bash" /etc/passwd | awk -F: '{print $1 " -> " $7}'
echo ""


echo "=== EXEMPLE: Processos corrent ==="
echo ""

# ps aux té columnes: USER PID %CPU %MEM ... COMMAND
# Agafem els processos de root i mostrem PID (col 2) i COMMAND (col 11)
echo "PID i comanda dels processos de root:"
ps aux | grep "^root" | awk '{print "PID: " $2 "  ->  " $11}' | head -5
echo ""


echo "=== EXEMPLE: Connexions de xarxa ==="
echo ""

# ss -tn mostra connexions TCP actives
# Columnes: State RecvQ SendQ LocalAddr:Port PeerAddr:Port
# Agafem l'adreça remota (col 5) de les connexions ESTAB
echo "Adreces remotes de les connexions actives:"
ss -tn 2>/dev/null | grep "ESTAB" | awk '{print $5}' | sort | uniq
echo ""


# ==========================================
# COMBINANT grep + awk SOBRE ELS LLIBRES
# ==========================================

SCRIPT_DIR="$(dirname "$0")"

if [ -f "$SCRIPT_DIR/dracula.txt" ]
then
    echo "=== EXEMPLE: Dracula - primera paraula de cada línia amb 'blood' ==="
    echo ""

    # grep troba les línies, awk agafa la primera paraula de cadascuna
    grep -i "blood" "$SCRIPT_DIR/dracula.txt" | awk '{print $1}' | sort | uniq -c | sort -rn | head -8

    # Llegim: "quina és la paraula MÉS FREQÜENT just DESPRÉS de 'dark'"
    echo ""
    echo "=== Paraula que ve just DESPRÉS de 'dark' a Dracula ==="
    grep -oi "dark [a-z]*" "$SCRIPT_DIR/dracula.txt" | awk '{print $2}' | sort | uniq -c | sort -rn | head -5
    # grep -o = retorna només el text que coincideix (no tota la línia)
    # "dark [a-z]*" = la paraula 'dark' seguida d'un espai i una altra paraula
fi


if [ -f "$SCRIPT_DIR/guerraDeLosMundos.txt" ]
then
    echo ""
    echo "=== EXEMPLE: Guerra dels Mons - la 3a paraula de les línies amb 'Martian' ==="
    grep "Martian" "$SCRIPT_DIR/guerraDeLosMundos.txt" | awk '{print $3}' | sort | uniq -c | sort -rn | head -5
fi
