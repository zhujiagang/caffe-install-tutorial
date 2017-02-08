rm -rf build
mkdir build
make clean  #把之前编译的去掉
make all -j16
make test -j16
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH
make runtest -j16
make pycaffe -j16
make matcaffe -j16
#1. 数据预处理
sh data/mnist/get_mnist.sh
#2. 重建lmdb文件。Caffe支持多种数据格式输入网络，包括Image(.jpg, .png等)，leveldb，lmdb，HDF5等，根据自己需要选择不同输入吧。
sh examples/mnist/create_mnist.sh
sh examples/mnist/train_lenet.sh