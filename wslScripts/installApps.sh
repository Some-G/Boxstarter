#!/bin/bash

echo "Installing apps..."

# Node.js repository
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
# Yarnpkg repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install openjdk-11-jdk nodejs yarn

echo "Applications successfully installed."