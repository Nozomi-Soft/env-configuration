debian_ver=`lsb_release -cs`;

sudo apt-get update;

sudo apt-get install apt-transport-https;
sudo apt-get install ca-certificates;
sudo apt-get install curl;
sudo apt-get install gnupg2;
sudo apt-get install software-properties-common;


curl -fsSl https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo `sudo apt-key fingerprint 0EBFCD88`;

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian ${debian_ver} stable"

sudo apt-get update;

#sudo apt-get install docker-ce=18.06.3~ce~3-0~debian;
sudo apt-get install docker-ce;

sudo docker run hello-world;

sudo usermod -aG docker $USER;

sudo sysctl -w vm.max_map_count=262144

docker network create -d bridge --subnet 10.0.0.1/24 nozomi-net

echo `docker network ls`

echo `docker network inspect nozomi-net`

#docker network rm nozomi-net
