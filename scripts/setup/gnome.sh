#!/bin/bash -

# Configure Gnome 3 the way I like it

# Special screenshots directory
gsettings set org.gnome.gnome-screenshot auto-save-directory "$HOME/Screenshots/"

# Turn off animations to improve performance
#gsettings set org.gnome.desktop.interface enable-animations false

# Remap caps lock to escape.
sudo apt-get install dconf-tools
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# Show clock in top bar
gsettings set org.gnome.desktop.interface clock-show-date true

