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

export FOG_DIRECTORY=auresodev
export FOG_REGION=ap-southeast-1
export AURESO_DATABASE_URL=postgres://phatjohboetlpm:AWsB6S-biwdJvFY8ixRQlncbss@ec2-54-83-205-46.compute-1.amazonaws.com:5432/dtc1h7i9820v6
export MONGOLAB_URI=mongodb://localhost:27017
export PARSE_APP_ID=WFlzfwz8QYnxYXe80JxALPHHS3TJsaLu0Mp5Rwti
export PARSE_API_KEY=ud142IN1m7ZsFEOrUEdmLSeuhVM9y7TkH5iZVf4A

# Zpice
export ADMIN_TOOL_CONFIRMATION_URL=http://localhost/#/login/confirmation
export ADMIN_TOOL_EDIT_PASSWORD_URL=http://localhost/#/login/change-password

export TEST_ENV_NUMBER=8

export GITHUB_API_TOKEN=3c3da5322e204fc006340f7681752c80411d8915
export NEW_RELIC_LICENSE_KEY=fa3c44bbd6c2155c54f078eed85f39f85fb9fd50

# GitHub Auth development keys
export GITHUB_KEY=835a1e61d6872fcb3e88
export GITHUB_SECRET=7e3903b3a20d2fc8d0734b6fddeb27df16f52240

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ck3g/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
