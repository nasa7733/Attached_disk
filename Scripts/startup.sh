sudo apt-get install lvm2 -y
sudo vgchange -ay sos
sudo mkdir -p /userdata
sudo mount /dev/sos/vol01 /userdata
sudo groupadd -g 234 Nasa
sudo more /etc/group | grep Nasa
sudo useradd -g 234 test_user
sudo more /etc/passwd | grep test_user
