#!/usr/bin/env bash
#
# ------------------------------------------------------------------------ #
# DESCRIÇÃO
#
# Exemplo de Debug
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção: -
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  Esse é um script exemplo, para que possa servir de exemplo uma boa maneira de realizar um debug.  
#
#  Exemplos:
#      $ ./debug.sh -d 2
#       No exemplo, o script irá realizar um debug de nível 2, que contempla também o debug de nível 1. 
# ------------------------------------------------------------------------ #
# Histórico - CHANGELOG
#
#   v1.0 26/02/2025, Lucas
#       - Início do programa
#       - Função de debug pronta e funcionando
#   v1.1 26/02/2025, Lucas
#       - Adicionando coloração
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.16
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ------------------------------ # 
NIVEL_DEBUG=0

# Adicionando as cores
VERMELHO="\033[31;1m"                                                       
AZUL="\033[34;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES -------------------------------- # 
# Funções começam com a primeira letra maiúscula
Debugar () {                                                                    # Função Debugar
    [ $1 -le $NIVEL_DEBUG ] && echo -e "${2}Debug $*"                           # Se $1 for menor ou igual a $NIVEL_DEBUG, printa "Debug (e os valores passados nas linhas 49 e 51)"
}

Soma () {
    local total=0                                                               # Variáveis locais são identificadas com um "local" na frente

    for i in $(seq 1 25); do                                                    # Enquanto i estiver na sequencia de 1 a 25, faça..
        Debugar 1 "${VERMELHO}" "Entrei no for com o valor: $i"                 # Puxando a função Debugar, e passando para ela os parametros: 1 e o texto seguinte 
        total=$(($total+$i))                                                    # Atribuindo a variável total, o valor que está sendo somado a cada iteração
        Debugar 2  "${AZUL}" "Depois da soma: $total"                           # Puxando a função Debugar, e passando para ela os parametros: 2 e o texto seguinte
    done
    echo $total                                                                 # Printando o total
}
# ------------------------------------------------------------------------ # 


# ------------------------------- EXECUÇÃO ------------------------------- #
case "$1" in                                                                    # Caso $1 seja..
    -d) [ $2 ] && NIVEL_DEBUG=$2 ;; # Verifica se existe                        # Verifica se $2 existe, caso sim, NIVEL_DEBUG recebe o segundo parâmetro
     *) Soma                                                                    # Caso esteja vazio, chame a função Soma
esac

Soma                                                                            # Chamando a função soma
# ------------------------------------------------------------------------ # 