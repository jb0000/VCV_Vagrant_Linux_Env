#!/usr/bin/env bash

# set -x

# fix apt warnings like:
# ==> default: dpkg-preconfigure: unable to re-open stdin: No such file or directory
# http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# Install basic development tools
#sudo dpkg --add-architecture i386
sudo apt-get update -qq
sudo apt-get -y install unzip git gdb curl cmake libx11-dev libglu1-mesa-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev zlib1g-dev libasound2-dev libgtk2.0-dev libjack-jackd2-dev jq
sudo locale-gen UTF-8

# Update compilers
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get -y install gcc-6 g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 20 --slave /usr/bin/g++ g++ /usr/bin/g++-6

# Get Rack SDK
cd /home/vagrant
wget -nv https://vcvrack.com/downloads/Rack-SDK-1.1.6.zip
unzip Rack-SDK-1.1.6.zip
rm Rack-SDK-1.1.6.zip

echo "export RACK_DIR=/home/vagrant/Rack-SDK" >> /home/vagrant/.bashrc

