#!/usr/bin/env bash

# Comparando dois numeros e vendo se são iguais

read -p "Digite um numero: " NUM1
read -p "Digite outro numero: " NUM2

if [ $NUM1 -gt $NUM2 ]; then
    echo "O número $NUM1 é maior que $NUM2."
elif [ $NUM1 -lt $NUM2 ]; then
    echo "O número $NUM1 é menor que $NUM2."
else
    echo "Os números são iguais!"
fi