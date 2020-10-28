#Primeiramente iremos instalar as dependências necessárias, para isso execute os comandos abaixo:

sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common

#Agora importaremos a chave do pacote docker:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Agora iremos adicionar o repositório do docker ao nosso sistema:

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"

#Em seguida iremos atualizar a lista de pacotes:

sudo apt-get update

#Por fim, instalaremos o docker e o docker-compose:

sudo apt-get -y install docker-ce docker-compose

#Será necessário adicionar nosso usuário ao grupo do docker para não haver necessidade de utilização do "sudo".

sudo usermod -aG docker $USER

#Verificando a versão do docker instalado:

docker --version
echo "Pressione qualquer tecla"
read