#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Um laço que conte de 0 a 10 que a cada iteração, verifica se o número é divisível por 2
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
for (( i=0; i<=10; i++ )); do
    [[ $i % 2 =0 ]] && echo "$i é divisivel por 2"
done
# ------------------------------------------------------------------------ #