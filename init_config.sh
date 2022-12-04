echo "###################################################";
echo "#		             Debian Configuration     	      #";
echo "###################################################";

echo "Please provide your linux's user_name";
read user_name;

usermod -aG root $user_name;
echo "source /etc/enviroment" | tee -a /root/.bashrc;
source /etc/enviroment;

echo "###################################################";
echo "#		             Sources Configuration   		      #";
echo "###################################################";

debian_ver=`lsb_release -c -s`;

sed -i '/cdrom/ s/#*//' /etc/apt/sources.list;
sed -i '/cdrom/ s/^/#/' /etc/apt/sources.list;
#echo "deb http://deb.debian.org/debian/ $debian_ver main contrib" | tee -a /etc/apt/sources.list;
#echo "deb-src http://deb.debian.org/debian/ $debian_ver main contrib" | tee -a /etc/apt/sources.list;
#echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list;
#add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main";
apt-get -y -f install software-properties-common;
#wget -q -O - http://dl.google.com/linux/linux_signing_key.pub | apt-key add -;

echo "===================================================";
echo "#		             Sources Configuration		        #";
echo "===================================================";

echo "###################################################";
echo "#		                 apt-get update           	  #";
echo "###################################################";

apt update;
apt-get update;
apt-get upgrade;

apt-get -y install build-essential;
echo "===================================================";
echo "#		               build-essential			          #";
echo "===================================================";

apt-get -f install net-tools;
echo "===================================================";
echo "#		                 net-tools                    #";
echo "===================================================";

apt-get -y install sudo;
echo "${user_name} ALL=(ALL:ALL) ALL" | tee -a /etc/sudoers;
sudo usermod -aG sudo $user_name;
echo "===================================================";
echo "#		       			       sudo                       #";
echo "===================================================";

sudo apt-get -f -y install maven;

echo "===================================================";
echo "#                     maven                       #";
echo "===================================================";

apt-get -y install openssh-server;
#/etc/ssh/shhd_config
#/etc/init.d/ssh restart
rm /etc/ssh/ssh_host_*;
dpkg-reconfigure openssh-server;
sed -i "/Port\ 22/ s/#*//" /etc/ssh/sshd_config;
echo "===================================================";
echo "#		               openssh-server                 #";
echo "===================================================";

apt-get -y -f install google-chrome-stable;
echo "===================================================";
echo "#     		       google-chrome-stable             #";
echo "===================================================";


apt-get install pass
pass init "my password storage key"
echo "===================================================";
echo "#                 password-storage-key            #";
echo "===================================================";
