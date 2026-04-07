#!/bin/bash

# ==========================================
# CONTROL DE FLUX AMB && I ||
#
# &&  = "i si ha anat bé, llavors..."  (AND)
# ||  = "i si ha fallat, llavors..."   (OR)
#
# Cada comanda retorna un codi de sortida:
#   0  = èxit  (cert)
#   >0 = error (fals)
# ==========================================


# --- Funcions de missatges ---

success() {
    echo "[  OK  ] $1"
}

warn() {
    echo "[ WARN ] $1"
}

error() {
    echo "[ ERROR] $1"
}

fail() {
    echo "[ FAIL ] $1"
    exit 1       # atura l'script amb codi d'error
}


# ==========================================
# && executa el segon bloc NOMÉS si el primer ha anat bé
# ==========================================

echo "=== Exemples amb && ==="
echo ""

# Exemple 1: crear fitxer i avisar si ha anat bé
touch /tmp/prova.txt && success "Fitxer creat correctament"

# Exemple 2: encadenar diverses accions
mkdir -p /tmp/carpeta_prova && touch /tmp/carpeta_prova/fitxer.txt && success "Carpeta i fitxer creats"

# Exemple 3: comprovar que existeix abans de llegir-lo
[ -f /tmp/prova.txt ] && success "El fitxer existeix, podem continuar"


# ==========================================
# || executa el segon bloc NOMÉS si el primer ha FALLAT
# ==========================================

echo ""
echo "=== Exemples amb || ==="
echo ""

# Exemple 1: avisar si no existeix el fitxer
[ -f /tmp/fitxer_que_no_existeix.txt ] || warn "El fitxer no existeix"

# Exemple 2: intentar crear una carpeta, fallar si no es pot
mkdir -p /tmp/carpeta_prova || fail "No s'ha pogut crear la carpeta"

# Exemple 3: comprovar una comanda i aturar l'script si falla
[ -d /tmp ] || fail "La carpeta /tmp no existeix, no podem continuar"


# ==========================================
# Combinant && i || junts
# comanda && success "..." || error "..."
# llegeix-ho com: "si va bé -> success, si falla -> error"
# ==========================================

echo ""
echo "=== Combinant && i || ==="
echo ""

# Cas que va bé
touch /tmp/fitxer_ok.txt && success "Fitxer creat" || error "No s'ha pogut crear el fitxer"

# Cas que falla (no tenim permisos per escriure a /root)
touch /root/fitxer_prohibit.txt && success "Fitxer creat" || error "No s'ha pogut crear el fitxer"

# Comprovar si un usuari existeix
id "root" &>/dev/null && success "L'usuari root existeix" || warn "L'usuari root no existeix"
id "usuari_inventat" &>/dev/null && success "L'usuari existeix" || warn "L'usuari 'usuari_inventat' no existeix"


# ==========================================
# Exemple pràctic: mini script de desplegament
# ==========================================

echo ""
echo "=== Simulació de desplegament ==="
echo ""

CARPETA_DEPLOY="/tmp/deploy_prova"

mkdir -p "$CARPETA_DEPLOY"          && success "Carpeta de deploy creada"   || fail "No s'ha pogut crear la carpeta"
touch "$CARPETA_DEPLOY/app.txt"     && success "Fitxers copiats"             || fail "Error copiant fitxers"
[ -f "$CARPETA_DEPLOY/app.txt" ]    && success "Verificació correcta"        || fail "El fitxer no s'ha copiat bé"

success "Deploy completat!"
