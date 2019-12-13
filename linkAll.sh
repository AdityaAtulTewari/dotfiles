#!/bin/bash

echo Linking bash
rm ~/.bashrc
rm ~/.bash_logout
rm ~/.bash_profile
rm -r ~/.util
ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash/bash_logout ~/.bash_logout
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/bash/util ~/.util

echo Linking vim
rm -r ~/.vim
rm ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

echo Linking git
rm ~/.git-prompt.sh
rm ~/.gitconfig
rm ~/.gitignore_global
ln -s ~/.dotfiles/git/git-prompt.sh ~/.git-prompt.sh
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

echo Linking tmux
rm ~/.tmux.comf
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

echo Set Git Values
git config --global core.excludesfile ~/.gitignore_global

