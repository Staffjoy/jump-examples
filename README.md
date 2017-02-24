# JuMP Examples [![Build Status](https://travis-ci.org/StaffJoy/jump-examples.svg?branch=master)](https://travis-ci.org/StaffJoy/jump-examples) [![Moonlight](https://img.shields.io/badge/Contractors-1-brightgreen.svg)](https://moonlightwork.com/staffjoy)

Optimization examples in [Julia](http://julialang.org/) using the [JuMP package](http://juliaopt.org) from the [StaffJoy](https://www.staffjoy.com) team.

## Installation

This repository is built for development using Vagrant. Vagrant provides local development virtual machines. Booting the associated Vagrant virtual machine in this repository installs all dependencies so that you can focus on the code. 

### Prerequisites

Install [Vagrant](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/).

### Booting the VM

1. Run `vagrant up`. This boots the virtual machine. Installation the first time will take a long time because the Ubuntu linux image must be downloaded and the dependencies must be compiled from source.
2. To enter the VM, run `vagrant ssh`. The repository folder is synced to `/vagrant/` and you can find examples in the `src` folder. All the tools you need - including Julia and solvers - are already installed.
3. When done, exit any SSH sessions and run `vagrant halt` to end the virtual machine. 

### Debugging

If you run into issues, it's possible that the base virtual image must be updated. To do this, run `vagrant destroy`, then rebuild the machine with `vagrant up`.

## Modifying problems

You can modify code either inside or outside of the virtual machine - it will sync immediately. To run the code, run `vagrant ssh` to enter the instance, go to the source code folder with `cd /vagrant/src/`, then execute code with `julia <file.jl>`.

## Presentations

This repository has been used in the following presentations:

* Feb 21 2015 - Philip Thomas on Predictive Analytics at SQuInT Breakout Sessions ([Slides](https://docs.google.com/presentation/d/1opWpSlkQvTcJbXfgzWbxlymA9fBgkqpEO_cxUFKHvJw/edit?usp=sharing))
