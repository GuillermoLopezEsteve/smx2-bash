#!/bin/bash

# ==========================================
# SERVEIS I PROCESSOS
# ==========================================


# --- Funcions de missatges (reutilitzem el mateix patró) ---
success() { echo "[  OK  ] $1"; }
warn()    { echo "[ WARN ] $1"; }
error()   { echo "[ ERROR] $1"; }


# ==========================================
# SERVEIS AMB systemctl
# ==========================================

echo "=== COMPROVAR SERVEIS ==="
echo ""

# Comprovar si un servei està actiu
servei="ssh"

if systemctl is-active --quiet "$servei"
then
    success "El servei '$servei' està CORRENT"
else
    warn "El servei '$servei' està ATURAT"
fi

# is-active --quiet = comprova sense mostrar res, només retorna cert/fals
# --quiet = no mostrar output, només el codi de sortida


# Comprovar si un servei està habilitat (s'inicia amb el sistema)
if systemctl is-enabled --quiet "$servei"
then
    success "El servei '$servei' s'INICIA automàticament en arrencar"
else
    warn "El servei '$servei' NO s'inicia automàticament"
fi


# Comprovar múltiples serveis d'un cop
echo ""
echo "=== ESTAT DE SERVEIS HABITUALS ==="

for servei in ssh cron ufw NetworkManager
do
    if systemctl is-active --quiet "$servei"
    then
        echo "  [ ACTIU ] $servei"
    else
        echo "  [ATURAT ] $servei"
    fi
done


# ==========================================
# PROCESSOS AMB ps I pgrep
# ==========================================

echo ""
echo "=== COMPROVAR PROCESSOS ==="
echo ""

# Comprovar si un procés està corrent pel seu nom
proces="bash"

if pgrep -x "$proces" > /dev/null
then
    success "El procés '$proces' ESTÀ corrent"
    echo "  PID(s): $(pgrep -x "$proces" | tr '\n' ' ')"
else
    warn "El procés '$proces' NO està corrent"
fi

# pgrep -x = busca processos amb exactament aquest nom
# PID = Process ID, el número identificador del procés


# Veure els 5 processos que més CPU consumeixen
echo ""
echo "=== TOP 5 PROCESSOS PER CPU ==="
ps aux --sort=-%cpu | head -6 | awk '{printf "  %-20s CPU: %s%%\n", $11, $3}'
# ps aux = llista tots els processos
# --sort=-%cpu = ordenats per CPU de major a menor
# awk = agafem el nom ($11) i el % de CPU ($3)


# Veure quanta memòria RAM queda lliure
echo ""
echo "=== MEMÒRIA RAM ==="
free -h | awk '/^Mem:/ {printf "  Total: %s  |  Usada: %s  |  Lliure: %s\n", $2, $3, $4}'
# free -h = mostra la memòria en format llegible (MB, GB)
# awk '/^Mem:/ = agafa només la línia que comença per "Mem:"


# Veure l'espai del disc
echo ""
echo "=== ESPAI EN DISC ==="
df -h | grep -v tmpfs | grep -v udev
# df -h = disk free, en format llegible
# grep -v = excloure les línies que contenen aquesta paraula
