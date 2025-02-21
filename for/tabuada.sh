#!/usr/bin/env bash

# Tabuada de 1 a 10 de um numero

read -p "Digite um numero e descubra sua tabuada:       " NUM

for i in $(seq 1 10); do
    echo " $i x $NUM = $(($i * $NUM))"
done