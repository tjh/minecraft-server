#!/bin/bash
 
# Usage: ./deploy.sh [host]
 
host="${1:-ubuntu@23.21.248.55}"
 
# The host key might change when we instantiate a new VM, so
# we remove (-R) the old host key from known_hosts
ssh-keygen -R "${host#*@}" 2> /dev/null
 
tar cj . | ssh -i ~/.ec2/keys/minecraft.pem -o 'StrictHostKeyChecking no' "$host" '
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
tar xj &&
sudo bash install.sh'
