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
sudo apt-get -y install git-flow

# ZShell
sudo apt-get -y install zsh
sudo chsh -s $(which zsh) root

sudo apt-get -y install vim
sudo apt-get -y install tmux
sudo apt-get -y install curl
sudo apt-get -y install httpie
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install exuberant-ctags
sudo apt-get -y install jq
sudo apt-get -y install jid
sudo apt-get -y install linux-tools-`uname -r` # perf
sudo apt-get -y install dstat
sudo apt-get -y install autojump
sudo apt-get -y install awscli
sudo apt-get -y install dnsmasq
sudo snap install code --classic
# sudo snap install gitkraken

# Password generation
sudo apt-get -y install pwgen

# Clipboard support
sudo apt install -y xclip

# https://unix.stackexchange.com/questions/442379/magic-mouse-2-driver-touch-scroll

# Ubuntu Kernel Updater
sudo add-apt-repository ppa:teejee2008/ppa
sudo apt-get update && sudo apt-get -y install ukuu

# Magic Mouse driver
sudo apt-get -y install dkms

# Heroku CLI
sudo snap install --classic heroku

# Shutter (for screenshots)
# https://www.linuxuprising.com/2018/10/shutter-removed-from-ubuntu-1810-and.html
sudo add-apt-repository ppa:linuxuprising/shutter
sudo apt-get update
sudo apt install -y shutter
sudo apt install -y gnome-web-photo

# Peek (for screen recording)
sudo add-apt-repository ppa:peek-developers/stable
sudo apt-get update
sudo apt-get -y install peek

# Kazam (for screencast with audio)
sudo apt-get -y install kazam

sudo snap install postman

# Diff So Fancy
sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -O /usr/local/bin/diff-so-fancy
sudo chmod 777 /usr/local/bin/diff-so-fancy

# Lastpass CLI
sudo apt-get -y install lastpass-cli

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable

# Languages
# rvm
# https://github.com/rvm/ubuntu_rvm
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get -y install rvm
sudo usermod -a -G rvm $(whoami)
sudo usermod -a -G rvm root

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# groovy
sudo apt-get -y install groovy

# Fonts
sudo apt-get install powerline fonts-powerline

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

# https://websiteforstudents.com/how-to-enable-ubuntu-18-04-lts-beta-to-play-videos-files/
sudo apt-get -y install libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly #libdvd-pkg
sudo apt-get -y install ubuntu-restricted-extras

# Utilities
sudo apt-get install htop

# Gnome tweaks
source ./scripts/setup/gnome.sh

# Unity Desktop
sudo apt install -y ubuntu-unity-desktop

# Stretchly (break timer)
mkdir -p ~/Applications
wget https://github.com/hovancik/stretchly/releases/download/v0.19.1/stretchly.0.19.1.AppImage -O ~/Applications
chmod 755 ~/Applications/stretchly.0.19.1.AppImage

# Install other software using custom install scripts
#install_scripts=(
    # Testing
    # bats.sh
    # Color
    #redshift.sh
    # JavaScript
    # doctorjs.sh
    # Ruby
    # prax.sh
    #observer_cli.sh
    #recon.sh
    #relx.sh
    #sync.sh
    spaceship_prompt.sh
    zsh.sh
#)

run_install_scripts $install_scripts
