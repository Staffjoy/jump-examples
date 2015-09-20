#!/bin/sh
set -e

apt-get install build-essential --yes --force-yes
add-apt-repository -y ppa:staticfloat/juliareleases
add-apt-repository -y ppa:staticfloat/julia-deps
apt-get update --yes --force-yes
apt-get install julia --yes --force-yes
