#!/bin/bash

#configs
apt upgrade

PPA=_ppa.sh
chmod +x $PPA
./$PPA

APT=_apt.sh
chmod +x $APT
./$APT

execute_install () {
	echo ""
	echo "###################################################################"
	echo "###### Instalando $1"
	echo "####################################################################"
	sudo chmod +x $1
	sudo ./$1
	echo "####################################################################"
}

for FILE in *;
do
	FILE_NAME=$(echo $FILE | grep -vEi "_|install\.sh" | egrep -c "\.sh$")
	if [ $FILE_NAME == 1 ] #verificar se arquivo pode ser executado
	then
		question=$(echo $FILE | grep -c "?")
		if [ $question == 1 ] #Verificar se o arquivo deve ser questionado para instalar
		then
			echo "Deseja instalar \"$FILE\"? (y) (n)"
			read installOrNotInstall
			if [ $installOrNotInstall == 'y' ]
			then
				execute_install $FILE
			fi
		else
			execute_install $FILE
		fi
	fi
done 

