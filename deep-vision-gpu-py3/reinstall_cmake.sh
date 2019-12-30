sudo apt-get --assume-yes remove cmake 
cd ~
git clone -b v3.15.5 https://cmake.org/cmake.git cmake
cd cmake
./bootstrap --system-curl
make -j$(nproc)
sudo make install 
