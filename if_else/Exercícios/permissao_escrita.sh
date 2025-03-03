#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Verificando se o usuário atual tem permissão de escrita em um arquivo
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  Exemplos:
#      $ ./permissao_escrita.sh
#      $ Digite o endereço completo do arquivo:     <digite o caminho do arquivo>
#
#      Após digitar o caminho do programa, o programa verificará se o arquivo existe.
#      Caso exista, mostrará se tem permissão de escrita. Caso não exista, mostrará que
#      o arquivo não existe. 
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
read -p "Digite o endereço completo do arquivo:     " FILE
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
if [ -e $FILE ]; then
    if [ -w $FILE ]; then
        echo "Você tem permissão de escrita no arquivo especificado."
    else
        echo "Você não tem permissão de escrita no arquivo especificado!"
    fi
else
    echo "O arquivo não existe!"
fi
# ------------------------------------------------------------------------ #