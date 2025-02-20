#!/usr/bin/env bash

STRING1="$1"
STRING2="$2"

echo "$STRING1 e $STRING2"

if [ "$STRING1" = "$STRING2" ]; then
    echo "As strings são iguais"
else
    echo "As strings não são iguais"
fi