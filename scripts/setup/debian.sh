#!/bin/bash -

###############################################################################
# Set flags so script is executed in "strict mode"
###############################################################################

set -u # Prevent unset variables
set -e # Stop on an error
set -o pipefail # Pipe exit code should be non-zero when a command in it fails
#ORIGINAL_IFS=$IFS
IFS=$'\t\n' # Stricter IFS settings

###############################################################################
# Install packages with apt-get
###############################################################################

# Make apt-get calls non-interactive
DEBIAN_FRONTEND=noninteractive

sudo apt-get update

# Tools I need for development
sudo apt-get -y install git
sudo apt-get -y install zsh
sudo apt-get -y install vim
sudo apt-get -y install tmux
sudo apt-get -y install curl
sudo apt-get -y install httpie
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install exuberant-ctags
sudo apt-get -y install jq
sudo apt-get -y install linux-tools-`uname -r` # perf
sudo apt-get -y install dstat
sudo apt-get -y install autojump
sudo apt-get -y install awscli
sudo apt-get -y install dnsmasq
sudo apt-get -y install docker
sudo snap install code --classic

# VirtualBox for VMs
sudo apt-get -y install virtualbox

# Shell script linting
sudo apt-get -y install shellcheck

# Communication apps
sudo apt-get -y install weechat
sudo apt-get -y install thunderbird
sudo apt-get -y install enigmail # For secure email
sudo snap install slack --classic
sudo snap install skype --classic

# For emoji
sudo apt-get -y install ttf-ancient-fonts


sudo apt-get -y install autoconf
sudo apt-get -y install libtool

# Photo editing
sudo apt-get -y install gimp

# Vector graphics
#sudo apt-get -y install inkscape

# Visualization library
sudo apt-get -y install graphviz

# Needed for Ruby and PostgreSQL
sudo apt-get -y install libffi-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev
# Needed for capybara
sudo apt-get -y install libqt4-dev libqtwebkit-dev

# JavaScript runtime
sudo apt-get -y install nodejs

# Postgres
sudo apt-get -y install postgresql
sudo apt-get -y install libpq-dev # development package
sudo apt-get -y install pgcli

# Install pip so we can install python packages easily
sudo apt-get -y install python-pip

# Zeal Docs
sudo add-apt-repository ppa:zeal-developers/ppa
sudo apt-get update
sudo apt-get -y install zeal

# ReText
sudo apt-get -y install retext

# Install Android Debug Bridge
#sudo apt-get -y install android-tools-adb

# Install mosh shell for high latency servers
sudo apt-get -y install mosh

# Install iperf so I can test network latency
sudo apt-get -y install iperf3

# Install Scribus for publishing
sudo apt-get -y install scribus

# Golang, for puma-dev
sudo apt-get -y install golang

# Misc other dependencies
sudo apt-get -y install ncftp python-paramiko python-pycryptopp lftp python-boto python-dev librsync-dev

# For network troubleshooting
sudo apt-get -y install mtr

# Screen recording
sudo apt-get -y install vokoscreen

# Sound recording
sudo apt-get -y install audacity

# Video editing
sudo apt-get -y install kdenlive

# Entertainment
sudo snap install vlc
sudo snap install spotify

# Assume we are using Gnome
#source gnome.sh

# Install other software using custom install scripts
install_scripts=(
    # Testing
    bats.sh
    # Color
    #redshift.sh
    # JavaScript
    doctorjs.sh
    # Ruby
    prax.sh
    # Erlang
    rebar.sh
    rebar3.sh
    #erlgrind.sh
    observer_cli.sh
    recon.sh
    relx.sh
    sync.sh
)

run_install_scripts $install_scripts
