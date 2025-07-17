# dotfiles


## Prerequisites

### Required tools
```bash
brew install nvim
brew install ripgrep
brew install fd
brew install bat
brew install eza
brew install zoxide
brew install starship
brew install jq

pip install --user black
pip install --user ruff
```

### Optional fonts (for better terminal experience)
```bash
brew install --cask font-jetbrains-mono-nerd-font
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
ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
mkdir -p ~/.config
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```

### Additional setup (after installation)
```bash
# Create Starship configuration directory if it doesn't exist
mkdir -p ~/.config

# The zshrc file includes modern CLI tool aliases and Starship prompt
# Make sure to restart your terminal or run: source ~/.zshrc
```

## vimfiles

## zsh

### Modern CLI Tools
The zshrc configuration includes aliases for modern CLI tools:
- `ls` → `eza` (better ls with icons)
- `cat` → `bat` (syntax highlighting)
- `grep` → `rg` (ripgrep - faster search)
- `find` → `fd` (better find)
- `z` → `zoxide` (smart cd)

### Prompt
- Uses [Starship](https://starship.rs/) prompt for better performance
- Fallback to oh-my-zsh avit-improved-minimal theme
- Shows git status with clean/dirty indicators

### Additional aliases
- Docker shortcuts: `d`, `dc`, `dcu`, `dcd`
- Rails shortcuts: `rs`, `rc`, `rr`, `rg`, `rdm`
- Git shortcuts: `gs`, `ga`, `gc`, `gp`, `gl`
- Utilities: `reload`, `myip`, `weather`

Command prompt originally customized by [How to Customize You Command Prompt](http://net.tutsplus.com/tutorials/tools-and-tips/how-to-customize-your-command-prompt/) tutorial.

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
unlink ~/.config/nvim/init.lua
unlink ~/.tmux.conf
unlink ~/.config/starship.toml
rm -rf ~/dotfiles
```

Then reopen terminal window

