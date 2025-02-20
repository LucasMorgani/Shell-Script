#!/usr/bin/env bash

echo "======== for clássico"
for (( i=0; i<=10; i++ )); do
    echo "$i"
done


echo "======== for seq"
for i in $(seq 0 10); do
    echo $i
done


echo "======== for array"
FRUTAS=(
    'Laranja'
    'Abacaxi'
    'Mamão'
    'Melancia'
)
for i in "${FRUTAS[@]}"; do
    echo $i
done

#EXPLICAÇÃO DO CODIGO
#   ${FRUTAS[@]}    O @ simboliza todos os itens do array