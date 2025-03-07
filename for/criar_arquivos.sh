#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Criar arquivos numerados automaticamente
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
# Exemplos:
#      $ ./criar_arquivos.sh
#       $ Digite o nome padrão para criar os arquivos    <nome>
#       $ Digite a quatidade de arquivos para criar      <qtde>
#       $ Digite a extensão desejada para os arquivos    <extensão>
#
#      Preencha os requisitos para criar a quantidade solicitada de arquivos padronizados
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
read -p "Digite o nome padrão para criar os arquivos                        "   NAMEFILE
read -p "Digite a quantidade de arquivos para criar (sequencial de 1..x ).  "   NUMFILE
read -p "Digite a extensão desejada para os arquivos                        "   EXTFILE
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
for ((i=1; i<=NUMFILE; i++)); do
    touch "$NAMEFILE-$i.$EXTFILE"
done

echo "Todos os arquivos foram criados!"
# ------------------------------------------------------------------------ #