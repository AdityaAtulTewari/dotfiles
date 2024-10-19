#!/bin/sh

echo Check pre-req
command -v zsh    || exit 1
command -v curl   || exit 1
command -v git    || exit 1
command -v tmux   || exit 1
command -v nvim   || exit 1
command -v go     || exit 1

echo Linking zsh
test -d $HOME/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f $HOME/.zshrc
rm -f $HOME/.zshenv
rm -f $HOME/.oh-my-zsh/themes/tewaro.zsh-theme
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zshenv $HOME/.zshenv
ln -s $HOME/.dotfiles/zsh/themes/tewaro.zsh-theme $HOME/.oh-my-zsh/themes/tewaro.zsh-theme

echo Linking nvim
rm -r $HOME/.config/nvim
mkdir -p $HOME/.config/
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

echo Linking git
rm $HOME/.gitconfig
rm $HOME/.gitignore_global
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global

echo Linking tmux
rm $HOME/.tmux.conf
ln -s $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

echo Setup Local Bin
mkdir -p $HOME/.local/bin

echo Setup Rust
test -d $HOME/.cargo || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer

echo Setup Haskell
test -d $HOME/.ghcup || curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

echo Setup Golang
command -v gopls || go install golang.org/x/tools/gopls@latest

echo Set Git Values
git config --global core.excludesfile $HOME/.gitignore_global

