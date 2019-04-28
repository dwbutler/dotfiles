#!/usr/bin/env bash

# Install Spaceship Prompt
# https://github.com/denysdovhan/spaceship-prompt

git clone https://github.com/denysdovhan/spaceship-prompt.git "~/.oh-my-zsh/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "~/.oh-my-zsh/themes/spaceship.zsh-theme"

