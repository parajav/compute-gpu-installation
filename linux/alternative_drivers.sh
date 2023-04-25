#!/bin/bash
echo "This specifically installs the CUDA11.7 and cuda-drivers"
# https://cloud.google.com/compute/docs/gpus/install-drivers-gpu
#Get PPA repo drivers and Install CUDA 11.7 
curl -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-11-7_11.7.0-1_amd64.deb
sudo dpkg -i cuda-11-7_11.7.0-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
sudo apt-get update
sudo apt-get install cuda-11-7 cuda-drivers -y

#Install cuda-compatibility 11.7 # not sure if this is required
sudo nvidia-smi -pm 1
sudo apt-get install cuda-compat-11.7
sudo apt-get update

#Set the environment for cuda 11.7
nano ~/.bashrc
export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}$ 
export LD_LIBRARY_PATH=/usr/local/cuda-11.7//lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
source ~/.bashrc
sudo ldconfig

# call the install cuDNN.sh script from here
#someone has to make sure that the other is executable
CUDNN_SCRIPT_PATH="./install_cuDNN.sh"
chmod a+x $SCRIPT_PATH
OUTPUT=$("$CUDNN_SCRIPT_PATH")
echo "running the cuDNN.sh shell script and output = " $OUTPUT

## To verify the installation
nvidia-smi # should not error out and display CUDA versiona nd driver
nvcc -V  # this should print the CUDA version installed on the system