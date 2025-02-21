#!/usr/bin/env bash

# Exibir os números pares de 1 a 20

for i in {1..20}; do
    (( i % 2 == 0 )) && echo "$i é par!"
done