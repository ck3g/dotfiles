# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="theunraveler-improved"
# ZSH_THEME="avit-improved"
ZSH_THEME="avit-improved-minimal"

# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ack="ack-grep"
alias be="bundle exec"
alias pr="poetry run"
# alias vim="/usr/local/bin/vim"
# alias bundle="/Users/ck3g/.rbenv/shims/bundle" # fucking cancer
alias cdgitlab="cd ~/Developer/GitLab/gitlab-development-kit/gitlab"

## Babbel repo alliases
alias update_develop="git co develop; git pull --rebase origin develop"
alias update_master="git co master; git pull --rebase origin master"

alias notifyme="osascript -e 'display notification \"You were waiting for command to finish. It is done now\" with title \"Work done\"'"

alias glab="/Users/vtatarintev/Developer/GitLab/cli/bin/glab"
alias cglab="/Users/vtatarintev/Developer/GitLab/community-cli/bin/glab"

# alias gitai="/Users/vtatarintev/Developer/rust/gitai/target/release/gitai"

# Modern CLI tool aliases
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias tree="eza --tree --icons"
alias cat="bat"
alias grep="rg"
alias find="fd"

# Utility aliases
alias reload="source ~/.zshrc"
alias myip="curl -s https://httpbin.org/ip | jq -r '.origin'"
alias weather="curl -s wttr.in/Berlin"

# Docker aliases
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcr="docker compose restart"
alias dps="docker ps"
alias dpsa="docker ps -a"

# Rails development
alias rs="rails server"
alias rc="rails console"
alias rr="rails routes"
alias rg="rails generate"
alias rdm="rails db:migrate"
alias rds="rails db:seed"
alias rdr="rails db:rollback"

# Ruby/Rails testing
alias rspec="bundle exec rspec"
alias rubocop="bundle exec rubocop"
alias brakeman="bundle exec brakeman"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias glog="git log --oneline --graph --decorate"


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
plugins=(git rails ruby battery web-search poetry)

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

# export ARCHFLAGS="-arch i386 -arch x86_64" # fix for mysql gem

export EDITOR=vim
export LC_ALL=en_US.UTF-8

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

export PATH="/opt/chefdk/bin:$PATH"

# For compilers to find libffi you may need to set:
# export LDFLAGS="-L/usr/local/opt/libffi/lib:$LDFLAGS"

# For pkg-config to find libffi you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"

# export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# For GitLab Development Kit https://gitlab.com/gitlab-org/gitlab-development-kit/blob/master/doc/prepare.md
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig:$PKG_CONFIG_PATH"

# brew info icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Go language path
# export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/Developer/Go:$PATH"
export PATH="$HOME/Developer/Go/bin:$PATH"

# Needed for poetry
export PATH="$HOME/.local/bin:$PATH"

# GitLab localhost test: Docker installation (for PagerDuty)
export GITLAB_HOME=$HOME/gitlab_localhost

# CUSTOM ENV VARS
source ~/.env_vars

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The -K and -A flags are deprecated and have been replaced
# by the --apple-use-keychain and --apple-load-keychain
# flags, respectively.  To suppress this warning, set the
# environment variable APPLE_SSH_ADD_BEHAVIOR as described in
# the ssh-add(1) manual page.
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

eval "$(/Users/vtatarintev/.local/bin/mise activate zsh)"
eval "$(mise hook-env)"

# Initialize zoxide for smarter cd
eval "$(zoxide init zsh)"

# Disable oh-my-zsh theme temporarily for Starship
ZSH_THEME=""

# Initialize Starship prompt
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vtatarintev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vtatarintev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vtatarintev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vtatarintev/google-cloud-sdk/completion.zsh.inc'; fi
