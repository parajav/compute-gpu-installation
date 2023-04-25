#!/bin/bash

# this will create GPU-VirtualMachine using gcloud api
# https://cloud.google.com/compute/docs/gpus/create-gpu-vm-general-purpose#gcloud
# https://cloud.google.com/compute/docs/gpus/install-drivers-gpu
gcloud compute instances create perception-ml-playground \
    --machine-type n2-standard-16 \
    --zone us-central1-a \
    --boot-disk-size 50GB \
    --accelerator type=nvidia-tesla-v100,count=1 \
    --image-family ubuntu-2204-lts \
    --image-project ubuntu-os-cloud  \
    --maintenance-policy TERMINATE --restart-on-failure \
    [--preemptible]


#example for Ubuntu 16.04 VM with 1 NVIDIA K80 GPU and 2 vCPUs in the us-east1-d zone.
''' 
gcloud compute instances create gpu-instance-1 \
    --machine-type n1-standard-2 \
    --zone us-east1-d \
    --boot-disk-size 40GB \
    --accelerator type=nvidia-tesla-k80,count=1 \
    --image-family ubuntu-1604-lts \
    --image-project ubuntu-os-cloud \
    --maintenance-policy TERMINATE --restart-on-failure
    '''