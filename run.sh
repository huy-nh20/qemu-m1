#!/bin/bash

type='.qcow2'
disk=$2$type
cmd=$1

echo $disk

if [ "$cmd" = "init" ]; then
read -p "Enter disk size (30G recommend): " size
qemu-img create -f qcow2 $disk $size

elif [ "$cmd" = "start" ];then
qemu-system-x86_64 -hda $disk -boot d -cdrom kali-linux-2022.3-installer-amd64.iso  -m 2G -usb -machine pc

elif [ "$cmd" = "launch" ];then
sudo qemu-system-x86_64 -hda $disk -boot d -m 2G -nic vmnet-bridged,ifname=en0 -usb -machine q35 -cpu max -smp cores=8,threads=1,sockets=1  &

elif [ "$cmd" = "list" ];then
find . -name "*.qcow2"

elif [ "$cmd" = "install" ]; then
brew install qemu

fi

