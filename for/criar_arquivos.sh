#!/usr/bin/env bash

# Criar arquivos numerados automaticamente

read -p "Digite o nome padrão para criar os arquivos                        "   NAMEFILE
read -p "Digite a quantidade de arquivos para criar (sequencial de 1..x ).  "   NUMFILE
read -p "Digite a extensão desejada para a criação do arquivo               "   EXTFILE

for ((i=1; i<=NUMFILE; i++)); do
    touch "$NAMEFILE-$i.$EXTFILE"
done

echo "Todos os arquivos foram criados!"
