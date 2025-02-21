#!/usr/bin/env bash

# Classificando a idade de uma pessoa

read -p "Digite sua idade!      " AGE

if [ $AGE -gt 0 ] && [ $AGE -le 12 ]; then
    echo "Você é uma criança!"
elif [ $AGE -gt 13 ] && [ $AGE -le 17 ]; then
    echo "Você é um adolescente!"
elif [ $AGE -gt 18 ] && [ $AGE -le 59 ]; then
    echo "Você é um adulto!"
elif [ $AGE -gt 60 ]; then
    echo "Você é um idoso!"
else
    echo "Você ainda nem nasceu!"
fi