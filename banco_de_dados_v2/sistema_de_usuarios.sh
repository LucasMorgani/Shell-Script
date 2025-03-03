#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# DESCRIÇÃO
# Sistema para gerenciamento de usuários
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  DESCRIÇÃO DETALHADA
#  Este programa faz todas as funções de gerenciamento de usuários, como:
#  Inserir, Deletar e Alterar
#
#  Exemplos:
#      $ source sistema_de_usuarios.sh
#      $ ListaUsuarios
# ------------------------------------------------------------------------ #
# HISTÓRICO - CHANGELOG
#
#   v1.0 //2025, Lucas:
#       - Tratamento de erros com relação ao arquivo do banco de dados
#       
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
ARQUIVO_DB="banco_de_dados.txt"
SEP=:
TEMP=temp.$$
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #


# ------------------------------- TESTES --------------------------------- #
[ ! -e "$ARQUIVO_DB" ] && echo "ERRO. Arquivo não existe." && exit 1
[ ! -r "$ARQUIVO_DB" ] && echo "ERRO. Sem permissão de leitura." && exit 1
[ ! -w "$ARQUIVO_DB" ] && echo "ERRO. Sem permissão de escrita." && exit 1
[ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1
# ------------------------------------------------------------------------ #


# ------------------------------- FUNÇÕES -------------------------------- #
ListaUsuarios () {
    egrep -v "^#|^$" "$ARQUIVO_DB" | tr : ' ' > "$TEMP"
    dialog --title "Lista de Usuarios" --textbox "$TEMP" 20 40
    rm -f "$TEMP"
}

ValidarUsuario () {
    grep -i -q "$1$SEP" "$ARQUIVO_DB"
}

InserirUsuario () {
    local ultimo_id="$(egrep -v "^#|^$" $ARQUIVO_DB | sort | tail -n 1 | cut -d $SEP -f 1)"
    local proximo_id=$(($ultimo_id+1))

    local nome=$(dialog --title "Cadastro de Usuários" --stdout --inputbox "Digite o seu nome" 0 0)
    ValidarUsuario "$nome" && {
        dialog --title "ERRO!" --msgbox "Usuário já cadastrado no sistema!" 6 40
    }

    local email=$(dialog --title "Cadastro de Usuários" --stdout --inputbox "Digite o seu E-mail" 0 0)

    echo "$proximo_id$SEP$nome$SEP$email" >> "$ARQUIVO_DB"
    dialog --title "SUCESSO!" --msgbox "Usuário cadastrado com sucesso!" 6 40

    ListaUsuarios
}

DeletarUsuario () {
    ValidarUsuario "$1" || return   # Se o usuário não existe, saia da função

    grep -i -v "$1$SEP" "$ARQUIVO_DB" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_DB"
}

OrdenaLista () {
    sort "$ARQUIVO_DB" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_DB"
}

# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
while :
do
    acao=$(dialog --title "Gerenciamento de Usuários 2.0" \
                  --stdout \
                  --menu "Escolha uma das opções abaixo:" \
                  0 0 0 \
                  listar "Listar todos os usuários do sistema" \
                  remover "Remover um usuário do sistema" \
                  inserir "Inserir um novo usuário no sistema")
    case $acao in
        listar)      ListaUsuarios        ;;
        inserir)    InserirUsuario       ;;
        # remover) RemoverUsuario ;;
    esac
done
# ------------------------------------------------------------------------ #