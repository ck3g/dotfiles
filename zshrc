# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="doubleend"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby rvm)

source $ZSH/oh-my-zsh.sh

# disable auto correct
unsetopt correct_all

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export ARCHFLAGS="-arch i386 -arch x86_64" # fix for mysql gem

export EDITOR=gvim

# GdeDK access keys
export GDEDK_TWITTER_CONSUMER_KEY=3dSPw7aCP15g6cQ96HG4g
export GDEDK_TWITTER_CONSUMER_SECRET=OfzBWCoq10Mq1FNs04q1ouvryJa82KxVwA1CHYZCpg

export GDEDK_FB_CONSUMER_KEY=420136191361429
export GDEDK_FB_CONSUMER_SECRET=44e73e8d07b6ade6cb13179d0c1b29b2

export GDEDK_VK_CONSUMER_KEY=3066082
export GDEDK_VK_CONSUMER_SECRET=tcYadXzdAglPGZgsPXLz

export GDEDK_GOOGLE_CONSUMER_KEY=770542715303.apps.googleusercontent.com
export GDEDK_GOOGLE_CONSUMER_SECRET=asHiVD07AO7Hfhr4dQTQ6et-

