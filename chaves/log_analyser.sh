#!/usr/bin/env bash
#
# ------------------------------------------------------------------------ #
# DESCRIÇÃO - DESCRIPTION
#
# Analisar os logs do sistema
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  O programa tem o intuito de analisar com um pouco mais de detalhe os logs do sistema, e filtrar por usuário
#
#  Exemplos:
#      ./log_analyzer.sh -e -u root -o resultado.txt
#      Isso filtraria apenas erros (-e) do usuário root e salvaria em resultado.txt.
# ------------------------------------------------------------------------ #
# Histórico - CHANGELOG
#
#   v1.0 25/02/2025, Lucas:
#       - Início do programa
#       - Conta com a funcionalidade X
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.16
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
MESSAGE="
        $(basename $0) - [OPÇÕES]
            -h - MENU DE AJUDA
            -v - VERSÃO
            
        [OPÇÕES DE VISUALIZAÇÃO]
            -e - ERROR
            -w - WARNING
            -i - INFOS
            -u <user> - LOGS ESPECÍFICOS
"
VERSION="1.0"

LOG_FILE="/var/log/syslog"
FILTER=""
USER_FILTER=""
OUTPUT_FILE=""

# ------------------------------------------------------------------------ #

    # ------------------------------- TESTES -------------------------------------------- #

    # ------------------------------------------------------------------------ #

    # ------------------------------- FUNÇÕES ------------------------------------------- #

    # ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ------------------------------------------ #

while [[ $# -gt 0 ]]; do                                                # Enquanto o número de argumentos for maior que 0, faça..
    case "$1" in                                                        # Caso o primeiro argumento seja uma dessas opções, faça..
        -e) FILTER="ERROR";;
        -w) FILTER="WARNING";;
        -i) FILTER="INFO";;
        -u) USER_FILTER="$2"; shift;; # Captura o nome do usuário       # O shift nessa ocasião muda o $1 (-u) para o atual $2 (root), encerrando assim o loop.
        -o) OUTPUT_FILE="$2"; shift;; # Define o arquivo de saída       # O shift nessa ocasião muda o $1 (-u) para o atual $2 (root), encerrando assim o loop.
        *) echo "Opção inválida: $1"; exit 1;;
    esac
    shift
done

# Construção do comando de busca
CMD="cat $LOG_FILE"                                                     # Dando um cat no LOG_FILE, arquivo especificado para passar pelo filtro
if [[ -n $FILTER ]]; then                                               # Se $FILTER não estiver vazio, faça..
    CMD="$CMD | grep \"$FILTER\""                                       # A variavel CMD está armazenando como texto um comando. Usando \ para escapar da string delimitada
fi
if [[ -n $USER_FILTER ]]; then                                          # Se $USER_FILTER não estiver vazio, faça..
    CMD="$CMD | grep \"$USER_FILTER\""                                  # A variavel CMD está armazenando como texto um comando. Usando \ para escapar da string delimitada
fi

# Execução do comando
RESULTS=$(eval $CMD)                                                    # O comando eval está executando como comando o que está dentro da variavel CMD (Que foi verificada no bloco acima)

# Exibição ou salvamento do resultado
if [[ -n $OUTPUT_FILE ]]; then                                          # Se a variável $OUTPUT_FILE não estiver vazia, faça..
    echo "$RESULTS" > "$OUTPUT_FILE"                                    # O echo de $RESULTS é encaminhado para o $OUTPUT_FILE definido na flag -o
    echo "Resultados salvos em $OUTPUT_FILE"                            
else
    echo "$RESULTS"                                                     # Caso não vá salvar em nenhum lugar, exiba o resultado
fi

# ------------------------------------------------------------------------ #