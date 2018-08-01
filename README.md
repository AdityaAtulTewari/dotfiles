# Dotfiles

## Installation Intructions
1. Clone the repository `git clone https://github.com/AdityaAtulTewari/dotfiles ~/.dotfiles`
1. Change the contents of `~/.dotfiles/git/gitconfig` to reflect your file system otherwise you are making commits as me.
1. Run `bash ~/.dotfiles/linkAll.sh`; Please note this will delete your current configuration files.
1. Run `vi ~/.vimrc`  within that file type `:PlugInstall`


In order to display things correctly you will need [powerline](https://github.com/powerline/fonts) fonts.
Additionally you may need to install [ctags](https://github.com/universal-ctags/ctags).

## Color Customization
By editing the file `~/.dotfiles/bash/util/prompt.sh`.
Look inside `~/.dotfiles/bash/util/colors.sh`, for valid colors (you can also add your own).
