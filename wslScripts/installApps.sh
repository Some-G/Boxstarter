#!/bin/bash

echo "Installing apps..."

# Node.js PPA
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
# Yarnpkg PPA
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# OpenJDK PPA
sudo add-apt-repository ppa:openjdk-r/ppa

sudo apt-get update
sudo apt-get -y install openjdk-14-jdk nodejs yarn

echo "Applications successfully installed."