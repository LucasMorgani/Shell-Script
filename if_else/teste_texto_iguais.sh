#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Script básico demonstrando um outro tipo de estrutura para utilizar o if
#
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
VAR="bola"
VAR2="casa"
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
if [[ "$VAR" = "$VAR2" ]]; then
    echo "Os textos das variáveis são iguais"
else
    echo "Os textos das variáveis não são iguais"
fi

[ "$VAR" = "$VAR2" ] && echo "Os textos das variáveis são iguais"                 # Nesse tipo de estrutura não é possivel utilizar um else, usar somente para verificação.
# ------------------------------------------------------------------------ #