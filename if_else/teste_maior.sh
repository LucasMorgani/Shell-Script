#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Script básico demonstrando a estrutura básica do if else
#
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
VAR=11
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
if [ $VAR > 10 ]; then
    echo "é maior que 10. O nome do script é: $0 | O PID é: $$."
else
    echo "O número é menor que 10"
fi
# ------------------------------------------------------------------------ #