# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="doubleend"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ack="ack-grep"
alias be="bundle exec"
alias vim="/usr/local/bin/vim"

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
plugins=(git rails ruby rvm battery web-search)

source $ZSH/oh-my-zsh.sh
export ZSH=$HOME/.oh-my-zsh
# source /etc/environment

# disable auto correct
unsetopt correct_all

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/Applications
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$JAVA_HOME # Add JAVA_HOME for keytool (cacert.org)
PATH=$PATH:/home/ck3g

export ARCHFLAGS="-arch i386 -arch x86_64" # fix for mysql gem

export EDITOR=mvim

eval "$(rbenv init - zsh)"

export AWS_ACCESS_KEY_ID="AKIAJPIRIFHT442CLRCA"
export AWS_SECRET_ACCESS_KEY="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"
export FOG_DIRECTORY="auresodev"
export FOG_REGION="ap-southeast-1"
export BONSAI_URL="localhost:9200"
export CDMS_POSTGRES_URL="postgres://cexlvtfejiqlfm:byllisaouegni2CtDk1ThJow_w@ec2-54-235-192-45.compute-1.amazonaws.com:5432/da6v6b3eijo43f"
# export CODECLIMATE_REPO_TOKEN=2d72497256a44a5d99888c7175263f3630376c5dff5effcdeed2f6d9330f212d
export TEST_ENV_NUMBER=4
