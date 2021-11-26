#!/bin/bash

sudo apt-get install lvm2 -y
 
sudo vgchange -ay sos

mkdir -p /userdata

sudo mount /dev/sos/vol01 /userdata
