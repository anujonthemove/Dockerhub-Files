sudo apt-get update 
sudo apt-get -y upgrade -f 
sudo apt-get -y dist-upgrade
sudo apt-get install -y apt-utils wget nano

sudo apt-get install -y python3 python3-dev
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
sudo wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py