#!/bin/sh
set -e

# Install dependencies for this repo
julia -e 'Pkg.add("JuMP")'
julia -e 'Pkg.add("Cbc")'
julia -e 'Pkg.add("NLopt")'

