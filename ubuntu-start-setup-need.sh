
sudo apt-get upgrade -y
sudo apt-get update
sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev -y

sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler -y
sudo apt-get install --no-install-recommends libboost-all-dev -y


sudo apt-get install -y python-numpy python-scipy python-matplotlib python-sklearn python-skimage python-h5py python-protobuf python-leveldb python-networkx python-nose python-pandas python-gflags cython ipython

sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev -y

echo "Installing OpenCV 2.4.10"
echo "Removing any pre-installed ffmpeg and x264"
sudo apt-get -y remove ffmpeg x264 libx264-dev
echo "Installing Dependenices"
sudo apt-get -y install libopencv-dev
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get -y install python-dev python-numpy
sudo apt-get -y install libtbb-dev
sudo apt-get -y install libqt4-dev libgtk2.0-dev
sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y install x264 v4l-utils ffmpeg
sudo apt-get -y install libgtk2.0-dev
sudo apt-get -y install gfortran swig

# swig 在 import python 时很重要

