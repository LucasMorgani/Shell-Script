#!/usr/bin/env bash
#
#
# ------------------------------------------------------------------------ #
# DESCRIÇÃO - DESCRIPTION
#
# lista_usuarios.sh - Extrai arquivos do /etc/passwd
#
# Autor:      Lucas Morgani
# Site:       -
# Manutenção: Nunca realizada
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  O nosso programa irá extrair do /etc/passwd, havendo a possibilidade de colocar
# em maiusculo e em ordem alfabética
#
#  Exemplos:
#      $ ./lista_usuarios.sh -s -m
#      Neste exemplo ficará em maiúsculo e em ordem alfabética
# ------------------------------------------------------------------------ #
# Histórico - CHANGELOG
#
#   v1.0 - 21/02/2025, Lucas:
#       Adicionando -s, -h, -v
#   v1.1 - 21/02/2025, Lucas:
#       Alterando os ifs para case
#   v1.2 - 21/02/2025, Lucas:
#       Adicionando o -m (colocar em maiúsculo)
#   v1.3 - 24/02/2025, Lucas:
#        Adicionando while com shift e teste de variável
#        Adicionando 2 flags
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.16
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"

#O comando $(basename) serve para remover o ././ do menu de opções
MENSAGEM_USO="
        $(basename $0) - [OPÇÕES]

        -h - Menu de ajuda
        -v - Versão
        -s - Ordem alfabética
        -m - Coloca em maiúsculo
"
VERSAO="v1.3"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES -------------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ------------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ------------------------------------------ #

while test -n "$1"
do
    case "$1" in
        -h) echo "$MENSAGEM_USO" && exit 0                  ;;
        -v) echo "$VERSAO" && exit 0                        ;;
        -s) CHAVE_ORDENA=1                                  ;;
        -m) CHAVE_MAIUSCULO=1                               ;;
        *) echo "Opção inválida, valide o -h." && exit 1    ;;
    esac
    shift
done

[ $CHAVE_ORDENA -eq 1 ]     &&  USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAIUSCULO -eq 1 ]  &&  USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"
# ------------------------------------------------------------------------ #