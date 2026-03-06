#! /usr/bin/env bash

# Python Packages
###############################################################################

# Install Pygments
pip install Pygments

# flake8 for linting
python -m pip install flake8

# csvkit for CSV utilities
pip install csvkit

# Node.JS Packages
###############################################################################

cd $HOME/dotfiles && npm install -g

# Perl Packages
###############################################################################

# Setup cpan and install packages for irssi
#cpan Lingua::Ispell
