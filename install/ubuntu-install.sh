#!/bin/sh
set -e

sudo apt-get install build-essential --yes --force-yes
sudo add-apt-repository -y ppa:staticfloat/juliareleases
sudo add-apt-repository -y ppa:staticfloat/julia-deps
sudo apt-get update --yes --force-yes
sudo apt-get install julia --yes --force-yes
