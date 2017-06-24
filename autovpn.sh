#!/bin/sh
script_dir=$(pwd)
sudo apt-get update
sudo apt-get install openvpn=2.3.10-1ubuntu2 easy-rsa=2.2.2-2 -y
make-cadir ~/openvpn-ca
echo "Backing up vars"
cp ~/openvpn-ca/vars ~/openvpn-ca/vars.back
echo "Copying your vars"
cp ${script_dir}'/vars' ~/openvpn-ca/vars
cd ~/openvpn-ca
source vars
./clean-all
./build-ca
server_name=$(grep KEY_NAME vars)
echo $server_name

