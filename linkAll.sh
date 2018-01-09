#!/bin/bash

echo Linking bash
ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash/bash_logout ~/.bash_logout
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/bash/util ~/.util

echo Linking vim
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

echo Linking git
ln -s ~/.dotfiles/git/git-prompt.sh ~/.git-prompt.sh
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

echo Set Git Values
git config --global core.excludesfile ~/.gitignore_global

