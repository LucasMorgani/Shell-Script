#!/usr/bin/env bash

# Um laço que conte de 0 a 10 que a cada iteração, verifica se o número é divisível por 2. caso ele seja divisível por 2, escreva uma mensagem na tela confirmando isso.

for (( i=0; i<=10; i++ )); do
    [[ $i % 2 =0 ]] && echo "$i é divisivel por 2"
done