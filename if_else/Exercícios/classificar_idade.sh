#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Script básico que classifica a idade que foi passada pelo usuário
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção: -
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
read -p "Digite sua idade!      " AGE
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
if [ $AGE -gt 0 ] && [ $AGE -le 12 ]; then
    echo "Você é uma criança!"
elif [ $AGE -gt 13 ] && [ $AGE -le 17 ]; then
    echo "Você é um adolescente!"
elif [ $AGE -gt 18 ] && [ $AGE -le 59 ]; then
    echo "Você é um adulto!"
elif [ $AGE -gt 60 ]; then
    echo "Você é um idoso!"
else
    echo "Você ainda nem nasceu!"
fi
# ------------------------------------------------------------------------ #