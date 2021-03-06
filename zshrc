# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="theunraveler-improved"
ZSH_THEME="avit-improved"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ack="ack-grep"
alias be="bundle exec"
alias vim="/usr/local/bin/vim"
alias cdgitlab="cd ~/Developer/GitLab/gitlab-development-kit/gitlab"

## Babbel repo alliases
alias update_develop="git co develop; git pull --rebase origin develop"
alias update_master="git co master; git pull --rebase origin master"


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
plugins=(git rails ruby battery web-search)

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

export EDITOR=vim
export LC_ALL=en_US.UTF-8

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="/opt/chefdk/bin:$PATH"

# For compilers to find libffi you may need to set:
export LDFLAGS="-L/usr/local/opt/libffi/lib:$LDFLAGS"

# For pkg-config to find libffi you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"

# For GitLab Development Kit https://gitlab.com/gitlab-org/gitlab-development-kit/blob/master/doc/prepare.md
export PATH="/usr/local/opt/postgresql@10/bin:/usr/local/opt/node@12/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Go language path
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/Developer/Go:$PATH"
export PATH="$HOME/Developer/Go/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ck3g/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ck3g/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ck3g/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ck3g/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
