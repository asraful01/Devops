#!/bin/bash
echo "uninstalling old versions"
sudo yum remove docker docker-engine docker.io containerd runc -y

echo "set up the repository"
sudo yum update -y
sudo yum install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
echo "Add Dockers official GPG key:"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
echo "installing docker container"
sudo yum install docker-ce docker-ce-cli containerd.io -y