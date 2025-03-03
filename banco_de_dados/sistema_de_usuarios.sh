#!/usr/bin/env bash
#
# --------------------------------HEADER---------------------------------- #
# Sistema para gerenciamento de usuários
#
# Autor:      Lucas Morgani
# Site:       -
# GitHub:     https://github.com/LucasMorgani
# Manutenção:
# Contato:    11 985168748         
# ------------------------------------------------------------------------ #
#  Este programa faz todas as funções de gerenciamento de usuários, como:
#  Inserir, Deletar e Alterar
#
#  Exemplos:
#      $ ./sistema_de_usuarios.sh
#       Após isso, o programa é bem interativo. basta mexer para entender.
# ------------------------------------------------------------------------ #
# HISTÓRICO - CHANGELOG
#
#   v1.0 27/02/2025, Lucas:
#       - Tratamento de erros com relação ao arquivo do banco de dados
#   v2.0 03/03/2025, Lucas:
#       - Encerrando as funcionalidades do programa
#       - Colocando algumas funções direto na execução do programa para melhor funcionamento dos botões de cancelar
# ------------------------------------------------------------------------ #
# TESTADO EM:
#   bash 5.1.16
# ------------------------------------------------------------------------ #


# ------------------------------ VARIÁVEIS ------------------------------- #
ARQUIVO_DB="banco_de_dados.txt"
SEP=:                                                                           # Variavel definindo o separador
TEMP=temp.$$                                                                    # Criando um arquivo temporário
# Definindo cores
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #


# ------------------------------- TESTES --------------------------------- #
[ ! -e "$ARQUIVO_DB" ] && echo "ERRO. Arquivo não existe." && exit 1            
[ ! -r "$ARQUIVO_DB" ] && echo "ERRO. Sem permissão de leitura." && exit 1
[ ! -w "$ARQUIVO_DB" ] && echo "ERRO. Sem permissão de escrita." && exit 1
[ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1
# ------------------------------------------------------------------------ #


# ------------------------------- FUNÇÕES -------------------------------- #
ListaUsuarios () {
    # Filtrando tudo que NÃO começa com '#' ou com espaço vazio 
    # levando o que restou ao tr e substituindo ':' por um espaço vazio
    # levando à variavel temporária
    egrep -v "^#|^$" "$ARQUIVO_DB" | tr : ' ' > "$TEMP"                         
    dialog --title "Lista de Usuarios" --textbox "$TEMP" 20 40                  # Abrindo um dialog
    rm -f "$TEMP"                                                               # Removendo a variavel temporária aberta
}   

ValidarUsuario () {                                                             
    grep -i -q "$1$SEP" "$ARQUIVO_DB"                                           
}
# ------------------------------------------------------------------------ #


# ------------------------------- EXECUÇÃO ------------------------------- #
while :
do
    acao=$(dialog --title "Gerenciamento de Usuários 2.0" \
                  --stdout \
                  --menu "Escolha uma das opções abaixo:" \
                  0 0 0 \
                  listar "Listar todos os usuários do sistema" \
                  remover "Remover um usuário do sistema" \
                  inserir "Inserir um novo usuário no sistema")
    [ $? -ne 0 ] && exit

    case $acao in
        listar)      ListaUsuarios        ;;
        #----------------------------------------------------------------------------------------------
        #----------------------------------------------------------------------------------------------
        #----------------------------------------------------------------------------------------------
        inserir)
            ultimo_id=$(egrep -v "^#|^$" "$ARQUIVO_DB" | sort -h | tail -n 1 | cut -d $SEP -f 1)        # Puxando o ultimo id inserido para adicionar sequencial
            proximo_id=$(($ultimo_id+1))                                                                # Definindo qual será o proximo id sequencial

            nome=$(dialog --title "Cadastro de Usuários" --stdout --inputbox "Digite o seu nome" 0 0)   # Setando o nome para inserir
            [ $? -ne 0 ] && continue                                                                    # Se clicar em cancelar, retorne ao menu
            [ ! "$nome" ] && {                                                                          # Se nome estiver vazio, dê um erro e retorne ao menu
                dialog --title "Erro" --msgbox "Nome não pode ser vazio!" 6 40
                continue
            }                                                                   

            ValidarUsuario "$nome" && {                                                                 # Chamando a função e passando o parametro $nome
                dialog --title "Erro Fatal" --msgbox "Usuário já cadastrado no sistema" 6 40            # Caso o resultado da função seja positivo, dê um erro fatal
                exit 1
            }

            email=$(dialog --title "Cadastro de Usuário" --stdout --inputbox "Digite o seu e-mail" 0 0) # Setando o email para inserir
            [ $? -ne 0 ] && continue                                                                    # Se clicar em cancelar, retorne ao menu
            [ ! "$email" ] && {                                                                         # Se email estiver vazio, dê um erro e retorne ao menu
                [ $? -ne 0 ] && continue
                dialog --title "erro" --msgbox "Email não pode ser vazio!" 6 40                     
                continue
            }                                                                  

            echo "$proximo_id$SEP$nome$SEP$email" >> $ARQUIVO_DB                                        # Adicionando os dados do usuário no $ARQUIVO_DB
            dialog --title "SUCESSO" --msgbox "Usuário cadastrado com sucesso!" 6 40                    

            ListaUsuarios                                                                               # Listando os usuários após adicionar
        ;;
        #----------------------------------------------------------------------------------------------
        #----------------------------------------------------------------------------------------------
        #----------------------------------------------------------------------------------------------
        remover)
            usuarios=$(egrep "^#|^$" -v "$ARQUIVO_DB" | sort -h | cut -d $SEP -f 1,2 | sed 's/:/ "/;s/$/"/')   # Filtra os usuários e ordena em ordem crescente numerica
            id_usuario=$(eval dialog --stdout --menu \"Escolha um usuario:\" 0 0 0 $usuarios)           # Abrindo um dialog e selecionando qual usuário remover
            [ $? -ne 0 ] && continue                                                                    # Se selecionar canceler, volte ao menu inicial

            grep -v "^$id_usuario$SEP" "$ARQUIVO_DB" > "$TEMP"                                          # Adicionando a nova lista com o usuário removido ao arquivo temporário 
            mv "$TEMP" "$ARQUIVO_DB"                                                                    # Trazendo o arquivo temporário para o banco de dados 

            dialog --msgbox "Usuário removido com sucesso"
            ListaUsuarios                                                                               # Listando os usuários
        ;;
    esac
done
# ------------------------------------------------------------------------ #