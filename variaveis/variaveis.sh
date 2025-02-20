NOME="Lucas"

echo "$NOME"

NUMERO_1=24
NUMERO_2=25

TOTAL=$(($NUMERO_1+$NUMERO_2)) #Em shell, utilizamos 2 parenteses para que o conteúdo não seja enxergado como subshell.

echo "$TOTAL"

SAIDA_CAT="$(cat /etc/passwd | grep skylab027)" #Exemplo de um conteúdo sendo enxergado como subshell, parenteses simples.

echo "$SAIDA_CAT"

echo "------------"

echo "Parametro 1: $1"
echo "Parametro 2: $2"

echo "Todos os parametros: $*"
echo "Quantos parametros? $#"
echo "Saída do ultimo comando: $?"
echo "PID: $$"

echo $0     # Retorna o nome do script