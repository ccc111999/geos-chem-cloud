#!/bin/bash
# Install Docker-CE on AWS Ubuntu VM
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce

sudo docker run --rm hello-world

sudo usermod -aG docker $USER  # re-login, no need to use `sudo` before docker commands
