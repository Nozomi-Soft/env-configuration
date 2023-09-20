debian_ver=`lsb_release -cs`;

sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

#sudo apt-get install docker-ce=18.06.3~ce~3-0~debian;
sudo apt-get install docker-ce;

sudo docker run hello-world;

sudo usermod -aG docker $USER;

sudo sysctl -w vm.max_map_count=262144

echo "Enter a network name (my-network)";
read NETWORK_NAME;

sudo docker network create -d bridge --subnet 10.0.0.1/24 $NETWORK_NAME

echo `sudo docker network ls`

echo `sudo docker network inspect $NETWORK_NAME`

#docker network rm $NETWORK_NAME
