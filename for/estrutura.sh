#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Tipos de estruturas para usar o for
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
echo "======== for clássico"
for (( i=0; i<=10; i++ )); do
    echo "$i"
done


echo "======== for seq"
for i in $(seq 0 10); do
    echo $i
done


echo "======== for array"
FRUTAS=(
    'Laranja'
    'Abacaxi'
    'Mamão'
    'Melancia'
)
for i in "${FRUTAS[@]}"; do
    echo $i
done
# ------------------------------------------------------------------------ #