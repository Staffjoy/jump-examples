#!/bin/sh
set -e
# Install dependencies for this repo
sudo apt-get install build-essential --yes --force-yes

julia -e 'Pkg.add("JuMP")'
julia -e 'Pkg.add("Cbc")'    # Branch and bound solver
julia -e 'Pkg.add("Ipopt")'  # Nonlinear solver
julia -e 'Pkg.add("Gadfly")' # Plotting

