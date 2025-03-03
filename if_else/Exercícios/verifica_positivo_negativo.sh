#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Verifica se um número é positivo ou negativo
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  DESCRIÇÃO DETALHADA
#
#  Exemplos:
#      $ ./verifica_positivo_negativo.sh <numero>
#       A verificação do numero será mostrada no terminal
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
NUMERO=$1
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
[[ $NUMERO -gt 0 ]] && echo "O número $NUMERO é positivo"
[[ $NUMERO -lt 0 ]] && echo "O número $NUMERO é negativo"
[[ $NUMERO -eq 0 ]] && echo "O número é um zero"
# ------------------------------------------------------------------------ #