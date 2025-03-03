#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Script básico que diz qual número é maior baseado nos números passados pelo usuário
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


# ------------------------------ VARIÁVEIS ------------------------------- #
read -p "Digite um numero: " NUM1
read -p "Digite outro numero: " NUM2
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
if [ $NUM1 -gt $NUM2 ]; then
    echo "O número $NUM1 é maior que $NUM2."
elif [ $NUM1 -lt $NUM2 ]; then
    echo "O número $NUM1 é menor que $NUM2."
else
    echo "Os números são iguais!"
fi
# ------------------------------------------------------------------------ #