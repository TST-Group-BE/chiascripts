#!/bin/bash

apt update
apt upgrade -y
apt install git software-properties-common iotop htop -y

git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules /home/chia/chia-blockchain
cd /home/chia/chia-blockchain
chmod +x ./install.sh
sh install.sh
. ./activate
chia init
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main
plotman config generate

cd /root
mkdir ca
wget -O /home/chia/ca/chia_ca.crt https://raw.githubusercontent.com/TST-Group-BE/chiascripts/main/ecopool/chia_ca.crt
wget -O /home/chia/ca/chia_ca.key https://raw.githubusercontent.com/TST-Group-BE/chiascripts/main/ecopool/chia_ca.key
wget -O /home/chia/ca/private_ca.crt https://raw.githubusercontent.com/TST-Group-BE/chiascripts/main/ecopool/private_ca.crt
wget -O /home/chia/ca/private_ca.key https://raw.githubusercontent.com/TST-Group-BE/chiascripts/main/ecopool/private_ca.key

chia init -c /home/chia/ca

chia configure --enable-upnp false
chia configure --set-farmer-peer 136.243.104.155:8447
chia configure --set-log-level INFO

wget -O /home/chia/chia-blockchain/venv/lib/python3.8/site-packages/chiapos.cpython-38-x86_64-linux-gnu.so https://raw.githubusercontent.com/TST-Group-BE/chiascripts/main/ecopool/chiapos.cpython-38-x86_64-linux-gnu.so

wget -O /home/chia/chia-blockchain/venv/lib64/python3.8/site-packages/chiapos.cpython-38-x86_64-linux-gnu.so https://raw.githubusercontent.com/TST-Group-BE/chiascripts/main/ecopool/chiapos.cpython-38-x86_64-linux-gnu.so
