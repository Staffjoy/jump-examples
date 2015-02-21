#!/bin/sh
set -e
sudo apt-get install --yes --force-yes build-essential gfortran pkg-config

# Install dependencies for this repo
julia -e 'Pkg.add("JuMP")'
julia -e 'Pkg.add("Cbc")'    # Branch and bound solver
julia -e 'Pkg.add("Ipopt")'  # Nonlinear solver
julia -e 'Pkg.add("Gadfly")' # Plotting
julia -e 'Pkg.add("Cairo")'  # PNG export support

