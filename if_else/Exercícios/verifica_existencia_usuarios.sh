#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Verificando se determinado usuário existe dentro do sistema
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  Exemplos:
#      $ ./usuarios.sh <usuario>
#      O programa irá validar se o usuário passado existe no sistema e mostrará no terminal.
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
USUARIO=$1
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
if id "$USUARIO" &>/dev/null; then                                              # Valida se o id $USUARIO existe. '&>/dev/null' encaminha qualquer mensagem (stdout or stderr) para o /dev/null.
    echo "O usuário '$USUARIO' existe no sistema."
else
    echo "O usuário '$USUARIO' NÃO existe no sistema."
fi
# ------------------------------------------------------------------------ #