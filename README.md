# dotfiles


## Prerequisites

```
brew install nvim
brew install ripgrep
brew install fd
```

## Install

```
cd ~
git clone https://github.com/ck3g/dotfiles.git
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/gemrc ~/.gemrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/githelpers ~/.githelpers
ln -s ~/dotfiles/ackrc ~/.ackrc
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/nvin/init.lua ~/.config/nvim/init.lua
```

## vimfiles

## zsh

Command prompt customized by [How to Customize You Command Prompt](http://net.tutsplus.com/tutorials/tools-and-tips/how-to-customize-your-command-prompt/) tutorial.

[Solarized Colorscheme for Gnome Terminal](https://github.com/sigurdga/gnome-terminal-colors-solarized)

## Uninstall

```
unlink ~/.vim
unlink ~/.oh-my-zsh
unlink ~/.vimrc
unlink ~/.zshrc
unlink ~/.gvimrc
unlink ~/.gemrc
unlink ~/.gitconfig
unlink ~/.githelpers
unlink ~/.ackrc
unlink ~/.gitignore_global
rm -rf ~/dotfiles
```

Then reopen terminal window

