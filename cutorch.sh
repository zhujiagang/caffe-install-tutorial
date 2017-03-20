rm -rf /home/user/torch
# Prefix:
PREFIX=/home/user/torch/install
echo "Installing Torch into: $PREFIX"

# Install dependencies for Torch:
sudo apt-get update
sudo apt-get install -qqy build-essential
sudo apt-get install -qqy gcc g++
sudo apt-get install -qqy cmake
sudo apt-get install -qqy curl
sudo apt-get install -qqy libreadline-dev
sudo apt-get install -qqy git-core
sudo apt-get install -qqy libjpeg-dev
sudo apt-get install -qqy libpng-dev
sudo apt-get install -qqy ncurses-dev
sudo apt-get install -qqy imagemagick
sudo apt-get install -qqy unzip
sudo apt-get install -qqy libqt4-dev
sudo apt-get install -qqy liblua5.1-0-dev
sudo apt-get install -qqy libgd-dev
sudo apt-get update


echo "==> Torch7's dependencies have been installed"


# Build and install Torch7
cd /tmp
rm -rf luajit-rocks
git clone https://github.com/torch/luajit-rocks.git
cd luajit-rocks
mkdir -p build
cd build
git checkout master; git pull
rm -f CMakeCache.txt
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi
make
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi
make install
RET=$?; if [ $RET -ne 0 ]; then echo "Error. Exiting."; exit $RET; fi

export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH
path_to_nvcc=$(which nvcc)
if [ -x "$path_to_nvcc" ]
then
    cutorch=ok
    cunn=ok
fi

# Install base packages:
$PREFIX/bin/luarocks install cwrap
$PREFIX/bin/luarocks install paths
$PREFIX/bin/luarocks install torch
$PREFIX/bin/luarocks install nn
#[ -n "$cutorch" ] && \
#($PREFIX/bin/luarocks install cutorch)

$PREFIX/bin/luarocks install /home/user/Downloads/cutorch/rocks/cutorch-1.0-0.rockspec
#[ -n "$cunn" ] && \
#($PREFIX/bin/luarocks install cunn)
$PREFIX/bin/luarocks install /home/user/Downloads/cunn/rocks/cunn-1.0-0.rockspec