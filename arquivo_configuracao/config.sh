#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# DESCRIÇÃO
#   Filtrando utilizando arquivo de configuração externo
#
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  DESCRIÇÃO DETALHADA
#   Filtrando e limpando um arquivo de configuração externo, e mostrando
#
#  Exemplos:
#      $ ./config.sh
#       A sacada é a alteração do arquivo 'configuracao.cf'. Altere para interagir com o script.
# ------------------------------------------------------------------------ #
# HISTÓRICO - CHANGELOG
#
#   v1.0 27/02/2025, Lucas:
#       - Início do programa
#       - Mostrando adequadamente a mensagem em maiusculo e colorindo
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #
# AGRADECIMENTOS:
# ------------------------------------------------------------------------ #



# ------------------------------ VARIÁVEIS ------------------------------- #
ARQUIVO_CONFIG="configuracao.cf"                                                # Definindo o arquivo de configuração
USAR_CORES=                                                                     # Variavel que receberá o valor do arquivo externo
USAR_MAIUSCULAS=                                                                # Variavel que receberá o valor do arquivo externo
MENSAGEM="Mensagem de teste"                                                    # Mensagem que será utilizada como padrão

# Colorindo o script
VERDE="\033[32;1m"
AZUL="\033[34;1m"
# ------------------------------------------------------------------------ #


# ------------------------------- TESTES --------------------------------- #
[ ! -r "$ARQUIVO_CONFIG" ] && echo "Não temos acesso de leitura!" && exit 1     # Testando para ver se possuimos permissão de leitura do arquivo de configuração
# ------------------------------------------------------------------------ #


# ------------------------------- FUNÇÕES -------------------------------- #
DefinirParametros () {                                                          # Abrindo a função DefinirParametros
    local parametro="$(echo $1 | cut -d = -f 1)"                                # parametro=echo $ARQUIVO_CONFIG | cut com delimitador '=' e 1° coluna (Pegando a primeira coluna do arq. externo)
    local valor="$(echo $1 | cut -d = -f 2)"                                    # valor=echo $ARQUIVO_CONFIG | cut com delimitador '=' e 2° coluna (Pegando a segunda coluna do arq. externo)

    case "$parametro" in                                                        # caso o valor de parametro seja..
        USAR_CORES)         USAR_CORES=$valor             ;;                    # USAR_CORES) $USAR_CORES recebe $valor (segunda coluna)
        USAR_MAIUSCULAS)    USAR_MAIUSCULAS=$valor        ;;                    # USAR_MAIUSCULAS) $USAR_MAIUSCULAS recebe $valor (segunda coluna)
    esac
}
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
while read -r linha                                                             # Leia $ARQUIVO_CONFIG
do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue                            # echo $linha | cortando a primeira aparição do '#' e continuando o programa
    [ ! "$linha" ] && continue                                                  # Se $linha estiver vazia, continue o programa
    DefinirParametros "$linha"                                                  # Chamando a função
done < "$ARQUIVO_CONFIG"                                                        # Levando a variável $ARQUIVO_CONFIG até o While


[ $USAR_MAIUSCULAS -eq "1" ] && MENSAGEM="$(echo $MENSAGEM | tr [a-z] [A-Z])"   # Se $USAR_MAIUSCULAS = 1, deixe a mensagem padrão em maiúsculo
[ $USAR_CORES -eq "1" ] && MENSAGEM="$(echo -e ${AZUL}$MENSAGEM)"               # Se $USAR_CORES= 1, deixe a mensagem padrão colorida

echo "$MENSAGEM"                                                                
# ------------------------------------------------------------------------ #