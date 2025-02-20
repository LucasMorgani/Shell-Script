#!/usr/bin/env bash

VAR="a"
VAR2="a"

if [[ "$VAR" = "$VAR2" ]]; then
    echo "São iguais."
fi

[ "$VAR" = "$VAR2" ] && echo "São iguais."