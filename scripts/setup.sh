#!/bin/bash -
###############################################################################
# setup.sh
# This script creates everything needed to get started on a new laptop
###############################################################################

# Unoffical Bash "strict mode"
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\t\n' # Stricter IFS settings
ORIGINAL_IFS=$IFS

cd $HOME

DOTFILES_DIR=$HOME/dotfiles
DOTFILE_SCRIPTS_DIR=$DOTFILES_DIR/scripts

###############################################################################
# Setup dotfiles
###############################################################################

if [ ! -d $DOTFILES_DIR ]; then
  if hash git 2>/dev/null; then
    echo "Git is already installed. Cloning repository..."
    git clone ssh://git@github.com/Stratus3D/dotfiles.git $DOTFILES_DIR
  else
    echo "Git is not installed. Downloading repository archive..."
    wget https://github.com/dwbutler/dotfiles/archive/master.tar.gz
    tar -zxvf master.tar.gz
    mv dotfiles-master dotfiles
    # TODO: If we have to download the archive, we don't git the .git
    # metadata, which means we can't run `git pull` in dotfiles directory to
    # update the dotfiles. Which means if we run this script again, the else
    # clause below will fail.
  fi
else
  cd $DOTFILES_DIR
  # We could have modifications in the repository, so we stash them
  git stash
  git pull origin master
  git stash pop
fi

# Change to the dotfiles directory either way
cd $DOTFILES_DIR

###############################################################################
# Create commonly used directories
###############################################################################
# TODO: These directory names are duplicated elsewhere. Reduce duplication
mkdir -p $HOME/bin # Third-party binaries
mkdir -p $HOME/lib # Third-party software
mkdir -p $HOME/nobackup # All files that shouldn't be backed up the normal way
mkdir -p $HOME/history # Zsh and Bash history files
mkdir -p $HOME/erl_libs # $ERL_LIBS directory
mkdir -p $HOME/devel
mkdir -p $HOME/devel/src # Go source directory
mkdir -p $HOME/devel/bin # Go binary directory
mkdir -p $HOME/devel/archived # Old projects
mkdir -p $HOME/Documentation
mkdir -p $HOME/Screenshots
mkdir -p $HOME/servers # For remote server mounts
mkdir -p $HOME/.psql # psql history directory

###############################################################################
# Install software on laptop
###############################################################################
# Get the uname string
unamestr=`uname`

# Install oh-my-zsh first, as the laptop script doesn't install it
ZSH_DIR="$HOME/.oh-my-zsh"
if [[ -d $ZSH_DIR ]]; then
    # Update Zsh if we already have it installed
    cd $ZSH_DIR
    git pull origin master
    cd -
else
    # Install it if don't have a ~/.oh-my-zsh directory
    curl -L http://install.ohmyz.sh | sh
fi

# Define a function used by the setup scripts to run all the custom install
# scripts.
run_install_scripts() {
    scripts_list="$1"
    install_scripts_dir=$HOME/dotfiles/scripts/setup/install

    # Run each script
    for file in $scripts_list; do
        "$install_scripts_dir/$file"
    done
}

# Run the OS-specific setup scripts
if [[ "$unamestr" == 'Darwin' ]]; then
    "$DOTFILE_SCRIPTS_DIR/setup/darwin.sh"
elif [[ "$unamestr" == 'Linux' ]]; then
    "$DOTFILE_SCRIPTS_DIR/setup/linux.sh"
fi

###############################################################################
# Install asdf for version management
###############################################################################
asdf_dir=$HOME/.asdf
cd $HOME

if [ ! -d $asdf_dir ]; then
    echo "Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git $asdf_dir
    echo "asdf installation complete"
else
    echo "asdf already installed"
fi

###############################################################################
# Create symlinks to custom config now that all the software is installed
###############################################################################
$DOTFILE_SCRIPTS_DIR/makesymlinks.sh

###############################################################################
# Reload the .bashrc so we have asdf and all the other recently installed tools
###############################################################################
source $HOME/.bashrc

# Install all the plugins needed
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf plugin-add postgres https://github.com/smashedtoatoms/asdf-postgres.git
asdf plugin-add rebar https://github.com/Stratus3D/asdf-rebar.git
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Imports Node.js release team's OpenPGP keys to main keyring
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# Install the software versions listed in the .tool-versions file in $HOME
asdf install

###############################################################################
# Install Misc. Packages
###############################################################################

$DOTFILE_SCRIPTS_DIR/setup/packages.sh

###############################################################################
# Check environment and print out results
###############################################################################

$DOTFILE_SCRIPTS_DIR/checkenv.sh
