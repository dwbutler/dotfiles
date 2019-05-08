#!/usr/bin/env bash

# Install Spaceship Prompt
# https://github.com/denysdovhan/spaceship-prompt

mkdir -p $HOME/.oh-my-zsh/custom/themes
git clone https://github.com/denysdovhan/spaceship-prompt.git $HOME/.oh-my-zsh/custom/themes/spaceship-prompt
rm $HOME/.oh-my-zsh/themes/spaceship.zsh-theme
ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme"

