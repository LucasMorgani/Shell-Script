#!/usr/bin/env bash
#
# ------------------------------------------------------------------------ #
# DESCRIÇÃO - DESCRIPTION
#
# Mostrar os usuários criados no sistema por alguém.
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção: -
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  DESCREVER O PROGRAMA DETALHADAMENTE E A FORMA DE UTILIZAÇÃO
#
#  Exemplos:
#      $ ./cotarBitcoin.sh -d 1
#      Neste exemplo o script será executado no modo debug nível 1.
# ------------------------------------------------------------------------ #
# Histórico - CHANGELOG
#
#   v1.0 24/02/2025, Lucas:
#       Criando a estrutura básica do programa
#
#
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.16
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
USERS="$(cat /etc/passwd | cut -d : -f 1,3)"
GROUPS="$(cat /etc/group | cut -d : -f 1,3)"

MESSAGE="
    $(basename $0) - [OPÇÕES]

    -h - Menu de ajuda
    -v - Versão

    -u - Listar TODOS usuários
    -g - Listar TODOS grupos

    -l - Listar os locais
    -s - Ordem Alfabética

    -c - Criar um novo usuário
    -G - Adicionar um usuário a um novo grupo
"
VERSION="1.0"

CHAVE_LOCAL=0
CHAVE_ALFABETIC=0
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES -------------------------------------------- #


# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ------------------------------------------- #

while test -n "$1"
do
    case "$1" in
        -h) echo "$MESSAGE" && exit 0                                   ;;
        -v) echo "Current Version: $VERSION" && exit 0                  ;;
        -u) echo "$USERS" && exit 0                                     ;;
        -g) echo "$GROUPS" && exit 0                                    ;;
        -l) CHAVE_LOCAL=1                                               ;;
        -s) CHAVE_ALFABETIC=1                                           ;;
         *) echo "Opção inválida, confira -h" && exit 1                 ;;
    esac
    shift
done

if [ $CHAVE_ALFABETIC -eq 1 ]; then
    USERS=$(echo "$USERS" | sort)
fi

if [ $CHAVE_LOCAL -eq 1 ]; then
    USERS=$(echo "echo $USERS" | "$(awk -F: '$2 >= 1000 {print $1, $2 "<---"}')")
fi
# USERS=$(echo "echo $USERS" | "$(awk '$2 >= 1000 {print $1, $2 "<---"}')")

#[ $CHAVE_ALFABETIC -eq 1 ]  && USERS=$(echo "$USERS" | sort)
#[ $CHAVE_LOCAL -eq 1 ]      && USERS=$(echo "$(awk -F: '$2 >= 1000 {print $1, $2 " <---"}')")

echo "$USERS"
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ------------------------------------------ #


# ------------------------------------------------------------------------ #
        #-l) echo "Os usuários criados localmente são:    " $LOCAL_USERS ;;