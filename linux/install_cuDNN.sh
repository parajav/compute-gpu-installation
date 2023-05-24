#!/bin/bash
echo "This specifically installs the cuDNN8.8  and cuda-drivers but not the cudatoolkit though"
# 11.7 and 11.7 are compatible mostly with CUDA11.7 only difference is that 11.7 has static linking
# refer the cuDNN documentation here: https://docs.nvidia.com/deeplearning/cudnn/support-matrix/index.html
selected=117 #dentoes 11.7
VER_11_7=117 #denotes CUDA11.7 and cuDNN 8.5
VER_11_8=118 #denotes CUDA11.8 and cuDNN 8.8.1

if [ "$selected" -eq "$VER_11_7" ]; then
    echo "installing CUDA11.7 and cuDNN 8.5"
    CUDNN_TAR_FILE="cudnn-linux-x86_64-8.5.0.96_cuda11-archive.tar.xz"
    wget https://developer.nvidia.com/compute/cudnn/secure/8.5.0/local_installers/11.7/cudnn-linux-x86_64-8.5.0.96_cuda11-archive.tar.xz
else
    echo "installing CUDA11.8 and cuDNN 8.8.1"
    CUDNN_TAR_FILE="cudnn-linux-x86_64-8.8.1.3_cuda11-archive.tar.xz"
    wget https://developer.nvidia.com/downloads/compute/cudnn/secure/8.8.1/local_installers/11.8/cudnn-linux-x86_64-8.8.1.3_cuda11-archive.tar.xz/
fi;


sudo tar -xzvf ${CUDNN_TAR_FILE}

#copy the files in cuda toolkit directory 
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
