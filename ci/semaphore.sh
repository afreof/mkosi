#!/bin/bash

set -ex

# Build an image
sudo add-apt-repository --yes ppa:jonathonf/python-3.6
sudo apt --yes update
sudo apt --yes install python3.6 python3-pip debootstrap systemd-container squashfs-tools

sudo python3.6 ./mkosi --default ./mkosi.files/mkosi.ubuntu

test -f ubuntu.raw

# Run unit tests
python3.6 -m pip install -U pytest
python3.6 -m pytest
