#!/usr/bin/env bash

# VERIFICA SE UM NÚMERO É POSITIVO, NEGATIVO, OU ZERO

NUMERO=$1

[[ $NUMERO -gt 0 ]] && echo "O número $NUMERO é positivo"
[[ $NUMERO -lt 0 ]] && echo "O número $NUMERO é negativo"
[[ $NUMERO -eq 0 ]] && echo "O número $NUMERO é um zero"