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

sudo apt-get install docker-ce;

sudo docker run hello-world;
