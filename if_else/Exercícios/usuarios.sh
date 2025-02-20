#!/usr/bin/env bash

USUARIO=$1

if id "$USUARIO" &>/dev/null; then
    echo "O usuário '$USUARIO' existe no sistema."
else
    echo "O usuário '$USUARIO' NÃO existe no sistema."
fi

#EXPLICANDO O CODIGO
#   id "$USUARIO"     executa o comando, se for bem sucedido, executa o bloco dentro do then.
#   &>/dev/null       encaminha qualquer mensagem (stdout or stderr) para o /dev/null.