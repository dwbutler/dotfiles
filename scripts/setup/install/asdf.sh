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

