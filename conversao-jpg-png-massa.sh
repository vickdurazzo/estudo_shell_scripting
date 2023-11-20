#!/bin/bash

converte_imagem(){
cd ~/Downloads/imagens-livros

if [ ! -d png ]
then
    mkdir png
fi

for imagem in *.jpg
# quando colocamos o *.jpg estamos praticamente passando o nome inteiro do arquivo para a variavel, por isso tiramos o .jpg dessa vez da variavel
do
# o -F é usado quando se deseja especificar um campo delimitador do parâmetro de texto passado, o campo delimitador da mensagem será o .
# o comando $() serve para guardar o resultado da execução
# o comando 'local' serve para definir o escopo da variavel, agora ela só pode ser acessada dentro da função
	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

#usamos o $? para peagr o status de saída da função
converte_imagem 2>erros_conversao.txt
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
 	echo "Houve uma falha no processo"
 fi

