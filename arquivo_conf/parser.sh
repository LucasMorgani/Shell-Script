#!/usr/bin/env bash

ARQUIVO_CONFIG="$1"

[ ! -e "$ARQUIVO_CONFIG" ] && echo "ERRO. Arquivo não existe."      && exit 1
[ ! -r "$ARQUIVO_CONFIG" ] && echo "ERRO. Sem acesso de leitura."   && exit 1

while read -r linha
do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue    # Se for comentário, próximo
    [ ! "$linha" ] && continue                          # Se for em branco, próximo

    chave="$(echo "$linha" | cut -d = -f 1)"
    valor="$(echo "$linha" | cut -d = -f 2)"

    echo "CONF_$chave=$valor"
done < "$ARQUIVO_CONFIG"