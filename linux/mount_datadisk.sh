#!/bin/bash
echo "This specifically mounts the data disk of size 300G"
sudo lsblk
echo "creating a mount directory /data-mount "
sudo mkdir -p /data-mount
sudo mount -o discard,defaults /dev/sdb /data-mount
lsblk |grep sdb
sudo chmod a+w /data-mount
df -h