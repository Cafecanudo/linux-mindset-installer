#configs
apt upgrade

PPA=_ppa.sh
chmod +x $PPA
./$PPA

APT=_apt.sh
chmod +x $APT
./$APT

FILES=$(ls | grep -v "_" | grep -v "install.sh")
for FILE in $FILES;
do
	echo "\n###################################################################"
	echo "###### Instalando $FILE"
	echo "####################################################################"
	sudo chmod +x $FILE
	sudo ./$FILE
	echo "####################################################################"
done 

