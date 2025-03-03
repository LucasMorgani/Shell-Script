#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Comparando duas strings, e verificando se elas são iguais.
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
#  Exemplos:
#      $ ./compara_string.sh -palavra1 -palavra2
#       - Nesse exemplo a saída será "As strings não são iguais"
#      $ ./compara_string.sh -palavra2 -palavra2
#       - Nesse exemplo a saída será "As strings são iguais"
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
STRING1="$1"
STRING2="$2"
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
echo "$STRING1 e $STRING2"

if [ "$STRING1" = "$STRING2" ]; then
    echo "As strings são iguais"
else
    echo "As strings não são iguais"
fi
# ------------------------------------------------------------------------ #