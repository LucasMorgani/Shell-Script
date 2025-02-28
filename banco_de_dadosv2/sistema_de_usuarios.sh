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
PrintaUsuarios () {
    local id="$(echo $linha | cut -d $SEP -f 1)"
    local nome="$(echo $linha | cut -d $SEP -f 2)"
    local email="$(echo $linha | cut -d $SEP -f 3)"

    echo -e "${VERDE}ID: ${VERMELHO}$id"
    echo -e "${VERDE}NOME: ${VERMELHO}$nome"
    echo -e "${VERDE}E-MAIL: ${VERMELHO}$email"
    echo "----------------------"
}

ListaUsuarios () {
    while read -r linha
    do
        [ "$(echo $linha | cut -c1)" = "#" ] && continue
        [ ! "$linha" ] && continue
        PrintaUsuarios "$linha"
    done < banco_de_dados.txt
}

ValidarUsuario () {
    grep -i -q "$1$SEP" "$ARQUIVO_DB"
}

InserirUsuario () {
    local nome="$(echo $1 | cut -d $SEP -f 2)"
    
    if ValidarUsuario "$nome"; then
        echo "Erro, usuário já existe"
    else
        echo "$*" >> "$ARQUIVO_DB"
        echo "Usuário cadastrado com sucesso"
    fi
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
# ------------------------------------------------------------------------ #