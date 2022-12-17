#before this mount the virtualbox-guest iso in cdrom0
sudo apt-get update;
sudo apt-get upgrade;
sudo apt-get install -y -f dkms;
#sudo apt-get install -y -f virtualbox-guest-dkms;
sudo mkdir /mnt/cdrom
sudo mount /dev/sr0 /mnt/cdrom
sudo sh /mnt/cdrom/autorun.sh

