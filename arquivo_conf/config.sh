#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# DESCRIÇÃO
#
#
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  DESCRIÇÃO DETALHADA
#
#
#  Exemplos:
#      $ ./
#      Neste exemplo
# ------------------------------------------------------------------------ #
# HISTÓRICAO - CHANGELOG
#
#   v1.0 //2025, Lucas:
#       - Início do programa
#       - Conta com a funcionalidade X
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #
# AGRADECIMENTOS:
# ------------------------------------------------------------------------ #



# ------------------------------ VARIÁVEIS ------------------------------- #
ARQUIVO_CONFIG="configuracao.cf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #


# ------------------------------- TESTES --------------------------------- #
[ ! -r "$ARQUIVO_CONFIG" ] && echo "Não temos acesso de leitura!" && exit 1
# ------------------------------------------------------------------------ #


# ------------------------------- FUNÇÕES -------------------------------- #
DefinirParametros (){
    local parametro="$(echo $1 | cut -d = -f 1)"
    local valor="$(echo $1 | cut -d = -f 2) "

    case "$parametro" in
        USAR_CORES)         USAR_CORES="$valor"             ;;
        USAR_MAIUSCULAS)   USAR_MAIUSCULAS="$valor"        ;;
    esac
}
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
while read -r linha
do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue
    [ ! "$linha" ] && continue
    DefinirParametros "$linha"
done < "$ARQUIVO_CONFIG"

echo "VALOR USAR_CORES: $USAR_CORES "
echo "VALOR USAR_MAIUSCULAS: $USAR_MAIUSCULAS"
# ------------------------------------------------------------------------ #