#!/usr/bin/env bash
#
# ------------------------------------------------------------------------ #
# DESCRIÇÃO
#
# Filtro de grupos com expressões regulares
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# -------------------------------------------------------
#  Exemplos:
#      $ ./regex.sh
#      O script executará todos os comandos de uma vez
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------- VARIÁVEIS ------------------------------ #
# ------------------------------------------------------------------------ #


# ------------------------------- TESTES --------------------------------- #
# ------------------------------------------------------------------------ #


# ------------------------------- FUNÇÕES -------------------------------- #
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
echo "Grupos que começam com a letra \"r\""
    cut -d : -f 1 /etc/group | grep "^r"
    echo "--------------------------------------"

echo "Grupos que terminam com a letra \"t\""
    cut -d : -f 1 /etc/group | grep "t$"
    echo "--------------------------------------"

echo "Grupos que comecem com a letra \"r\" e terminam com a letra \"t\""
    cut -d : -f 1 /etc/group | grep "^r.*t$"
    echo "--------------------------------------"

echo "Grupos que terminam com a letra \"e\" ou \"d\""
    cut -d : -f 1 /etc/group | grep [ed]$
    echo "--------------------------------------"
echo "Grupos que começam com qualquer caractere e a segunda letra seja um \"u\" ou \"d\""
    cut -d : -f 1 /etc/group  | grep "^.[ud]"
    echo "--------------------------------------"
echo "Grupos que tenha seu nome de 2 a 4 caracteres de tamanho"
    cut -d : -f 1 /etc/group | egrep "^.{2,3}.$"
    echo "--------------------------------------"

echo "Grupos que comecem com \"r\" ou \"s\" (use o operador OR)"
    cut -d : -f 1 /etc/group | egrep "^[r|s]"
    echo "--------------------------------------"



# ------------------------------------------------------------------------ #