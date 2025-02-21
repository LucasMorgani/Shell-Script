#!/usr/bin/env bash

# Verificando se o usuário tem permissão de escrita em um arquivo

read -p "Digite o endereço completo do arquivo:     " FILE

if [ -w $FILE ]; then
    echo "Você tem permissão de escrita no arquivo especificado."
else
    echo "Você não tem permissão de escrita no arquivo especificado, ou ele não existe!"
fi
