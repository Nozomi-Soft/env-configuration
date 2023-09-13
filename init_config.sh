echo "#####################################################################"
echo "#		             Debian Configuration     	                      #"
echo "#####################################################################"

echo "Please provide your linux's user_name"
read user_name

usermod -aG root $user_name
echo "source /etc/enviroment" | tee -a /root/.bashrc
source /etc/enviroment

echo "#####################################################################"
echo "#		             Sources Configuration   		                  #"
echo "#####################################################################"

debian_ver=`lsb_release -c -s`

sed -i '/cdrom/ s/#*//' /etc/apt/sources.list
sed -i '/cdrom/ s/^/#/' /etc/apt/sources.list
#echo "deb http://deb.debian.org/debian/ $debian_ver main contrib" | tee -a /etc/apt/sources.list
#echo "deb-src http://deb.debian.org/debian/ $debian_ver main contrib" | tee -a /etc/apt/sources.list
wget -q -O - http://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list.d/google-chrome.list
#add-apt-repository "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"

echo "===================================================================="
echo "#		             software-properties-common                      #"
echo "===================================================================="

apt-get -y -f install software-properties-common


echo "####################################################################"
echo "#		                 apt-get update           	                 #"
echo "####################################################################"

apt-get update
apt-get upgrade

echo "===================================================================="
echo "#		               build-essential			                     #"
echo "===================================================================="

apt-get -y install build-essential

echo "===================================================================="
echo "#		                 net-tools                                   #"
echo "===================================================================="

apt-get -f install net-tools

echo "===================================================================="
echo "#		       			       sudo                                  #"
echo "===================================================================="

apt-get -y install sudo
echo "${user_name} ALL=(ALL:ALL) ALL" | tee -a /etc/sudoers
usermod -aG sudo $user_name

echo "===================================================================="
echo "#                     maven                                        #"
echo "===================================================================="

apt-get -f -y install maven

echo "===================================================================="
echo "#		               openssh-server                                #"
echo "===================================================================="

apt-get -y install openssh-server
#/etc/ssh/shhd_config
#/etc/init.d/ssh restart
rm /etc/ssh/ssh_host_*
echo "sshd : ALL" | tee -a /etc/host.allow
sed -i "/Port\ 22/ s/#*//" /etc/ssh/sshd_config
sudo dpkg-reconfigure openssh-server
systemctl restart ssh.service

echo "===================================================================="
echo "#	               openssh-server   " | echo `systemctl status ssh.service`
echo "===================================================================="

echo "===================================================================="
echo "#     		       google-chrome-stable                          #"
echo "===================================================================="

apt-get -y -f install google-chrome-stable

echo "===================================================================="
echo "#                 password-storage-key                             #"
echo "===================================================================="

apt-get -f -y install pass
pass init "my password storage key"


echo "===================================================================="
echo "#                 apt-transport-https                              #"
echo "===================================================================="

apt-get install -y -f apt-transport-https

echo "===================================================================="
echo "#                     ca-certificates                              #"
echo "===================================================================="

apt-get install -y -f ca-certificates

echo "===================================================================="
echo "#                            curl                                  #"
echo "===================================================================="

apt-get install -y -f curl

echo "===================================================================="
echo "#                            gnupg2                                #"
echo "===================================================================="

apt-get install -y -f gnupg gnupg2

echo "===================================================================="
echo "#                           Done                                   #"
echo "===================================================================="
