#!/bin/bash

type='.qcow2'
disk=$2$type
cmd=$1


if [ "$cmd" = "init" ]; then
mkdir $2
read -p "Enter disk size (30G recommend): " size
qemu-img create -f qcow2 $disk $size
mv $disk $2

elif [ "$cmd" = "start" ];then
qemu-system-x86_64 -hda $2/$disk -boot d -cdrom $3  -m 2G -usb -machine pc

elif [ "$cmd" = "launch" ];then
qemu-system-x86_64 -hda $2/$disk -boot d -m 2G -nic vmnet-bridged,ifname=en0 -usb -machine q35 -cpu max -smp cores=8,threads=1,sockets=1  &

elif [ "$cmd" = "list" ];then
find . -name "*.qcow2"

elif [ "$cmd" = "install" ]; then
brew install qemu

fi

