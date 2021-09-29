#!/bin/sh

echo Linking zsh
test -d $HOME/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc
rm $HOME/.zshenv
rm $HOME/.oh-my-zsh/themes/tewaro.zsh-theme
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zshenv $HOME/.zshenv
ln -s $HOME/.dotfiles/zsh/themes/tewaro.zsh-theme $HOME/.oh-my-zsh/themes/tewaro.zsh-theme

echo Linking vim
rm -r $HOME/.vim
rm $HOME/.vimrc
ln -s $HOME/.dotfiles/vim $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc

echo Linking git
rm $HOME/.gitconfig
rm $HOME/.gitignore_global
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global

echo Linking tmux
rm $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

echo Setup Local Bin
mkdir -p $HOME/local/bin

echo Set Git Values
git config --global core.excludesfile $HOME/.gitignore_global

