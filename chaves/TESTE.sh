#!/bin/bash

USERS="$(awk -F: '{print $1, $3}' /etc/passwd)"  # Pega nome do usuário e UID
GROUPS="$(cut -d : -f 1,3 /etc/group)"

MESSAGE="
    $(basename $0) - [OPÇÕES]

    -h - Menu de ajuda
    -v - Versão

    -u - Listar TODOS usuários
    -g - Listar TODOS grupos

    -l - Listar os locais (usuários com UID >= 1000)
    -s - Ordem Alfabética

    -c - Criar um novo usuário
    -G - Adicionar um usuário a um novo grupo
"
VERSION="1.0"

CHAVE_LOCAL=0
CHAVE_ALFABETIC=0
# ------------------------------------------------------------------------ #

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

# Filtrando usuários com UID >= 1000
if [ $CHAVE_LOCAL -eq 1 ]; then
    USERS=$(echo "$USERS" | awk '$2 >= 1000 {print $1, $2 " <---"}')
fi

# Ordenando os usuários em ordem alfabética **após** a filtragem
if [ $CHAVE_ALFABETIC -eq 1 ]; then
    USERS=$(echo "$USERS" | sort -k1)  # Ordenando pela 1ª coluna (nome do usuário)
fi

echo "$USERS"
