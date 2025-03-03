#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Mostrar os usuários criados no sistema por alguém.
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção: -
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  Exemplos:
#      $ ./usuarios_sistema.sh -l -s
#      Nesse exemplo, o script irá listar todos os usuários locais e coloca-los em ordem alfabética
#      $ ./usuarios_sistema.sh -c Lucas
#      Nesse exemplo, o script irá criar um usuário chamado Lucas
# ------------------------------------------------------------------------ #
# Histórico - CHANGELOG
#   v1.0 24/02/2025, Lucas:
#       Criando a estrutura básica do programa
#   v2.0 26/02/2025 Lucas:
#       Reestruturando o script
#       Adicionando as funcionalidades de filtragem
#       Adicionando criação de novos usuários
#       Adicionando comentários ao código
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------- VARIÁVEIS ------------------------------ #
USERS_FILE="$(cat /etc/passwd | cut -d : -f 1,3)"                                   # Definindo o arquivo que será utilizado, e delimitando-o

MESSAGE="
    $(basename $0) - [OPÇÕES]

    -h - Menu de ajuda
    -v - Versão
    -u - Listar TODOS usuários
    -l - Listar os locais
    -s - Ordem Alfabética
    -c <user>- Criar um novo usuário
"
VERSION="2.0"

LOCAL_USERS=0                                                                       # Definindo a variável para utilizar no filtro de usuários locais
ALPHABETICAL=0                                                                      # Definindo a variável para utilizar no filtro em ordem alfabética
NEW_USER=""                                                                         # Definindo a variável que ficará o nome do novo usuário

RESULT=""
# ------------------------------------------------------------------------ #

 
# ------------------------------- EXECUÇÃO ------------------------------- #

while test -n "$1"; do
    case "$1" in
        -h) echo "$MESSAGE" && exit 0                                   ;;
        -v) echo "Current Version: $VERSION" && exit 0                  ;;
        -u) echo "$USERS" && exit 0                                     ;;
        -l) LOCAL_USERS=1                                               ;;          
        -s) ALPHABETICAL=1                                           ;;
        -c) NEW_USER="$2";shift;;
         *) echo "Opção inválida, confira -h" && exit 1                 ;;
    esac
    shift
done

RESULT=$USERS_FILE                                                                  # Definindo a variável resultado para receber $USERS_FILE

if [[ $LOCAL_USERS -eq 1 ]]; then                                                   # Se LOCAL_USERS for igual a 1, faça..
    RESULT="$(echo "$RESULT" | awk -F ':' '$2 >= 1000 {print $1, $2}')"             # RESULT recebe a execução do comando ( mostre RESULT passando para awk que está filtrando todos maiores ou iguais a 1000 com o delimitador : )
fi
 
if [ $ALPHABETICAL -eq 1 ]; then                                                    # Se ALPHABETICAL for igual a 1, faça..
    RESULT="$(echo "$RESULT" | sort)"                                               # RESULT recebe a execução do comando ( mostre RESULT em ordem alfabética )
fi

if [[ -n $NEW_USER ]]; then                                                         # Se NEW_USER não estiver vazio, faça..
    sudo adduser $NEW_USER                                                          # Adicionando o usuário
    echo "(O usuário $NEW_USER foi adicionado com sucesso!)"                  
fi

echo "$RESULT"                                                                      # Mostrando o que tem dentro da variável RESULT
# ------------------------------------------------------------------------ #