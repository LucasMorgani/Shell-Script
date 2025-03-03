#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Extrair titulo de postagens de site
#
#
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  O programa extrai texto baseado na estrutura HTML de determinado tipo de site.
#
#
#  Exemplos:
#      $ ./extrair_texto.sh
#      Neste exemplo, o programa vai extrair os titulos das postagens de um blog e printar no terminal
# ------------------------------------------------------------------------ #
# HISTÓRICO - CHANGELOG
#
#   v1.0 27/02/2025, Lucas:
#       - Início do programa
#       - Conta com a funcionalidade de extração de titulo
#   v1.1 03/03/2025
#       - Ajustes finais sem alteração no código
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   - bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
ARQUIVO_TITULOS="titulo.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #


# ------------------------------- TESTES --------------------------------- #
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y # Instalando lynx caso não esteja instalado
# ------------------------------------------------------------------------ #


# ------------------------------- FUNÇÕES -------------------------------- #
# ---------------------------- -------------------------------------------- #


# ------------------------------- EXECUÇÃO ------------------------------- #
lynx -source https://lxer.com/ | grep "=\"storyheadline" | sed 's/<div\ class.*line">//;s/<\/span>.*meta">//' > titulo.txt

while read -r titulo_lxer
do
    echo -e "${VERMELHO}Titulo: ${VERDE}$titulo_lxer"
done < "$ARQUIVO_TITULOS"
# ------------------------------------------------------------------------ #
