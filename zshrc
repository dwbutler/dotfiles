# Zshrc file

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_PACKAGE_SHOW=false

# This is faster than `autoload -U compinit && compinit`
autoload -Uz compinit
compinit

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  aws
  git
  gitfast
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  docker-compose
  autojump
  fasd
  common-aliases
  last-working-dir
  tmux
  tmuxinator
  rails
  web-search
  colored-man-pages
  nvm
)

DISABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh

# For my dotfiles repo to work correctly the paths to source'd files must be
# relative to the location of this file. This doesn't handle cases where the
# .zshrc is symlinked to a symlink.
# Taken from http://stackoverflow.com/a/26492107/1245380
ZSHRC_PATH=$(dirname "$(readlink "${(%):-%N}")")

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# We need this so that tmux uses zsh when started in a zsh shell
export SHELL='/bin/zsh'

source $ZSHRC_PATH/mixins/general
source $ZSHRC_PATH/mixins/functions
source $ZSHRC_PATH/mixins/grep
source $ZSHRC_PATH/mixins/path
source $ZSHRC_PATH/mixins/asdf
source $ZSHRC_PATH/mixins/aliases
source $ZSHRC_PATH/mixins/man_color

# Save all history
# Incrementally write history to file
setopt INC_APPEND_HISTORY
# Save timestamp to history file too
setopt EXTENDED_HISTORY
# Import newly written commands from the history file
setopt SHARE_HISTORY

precmd() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history | tail -n 1)" >>! $HOME/history/zsh-history-$(date "+%Y-%m-%d").log;
    fi
}

# Use vi mode
#bindkey -v

# Vi mode settings
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Easier, more vim-like editor opening
# `v` is already mapped to visual mode, so we need to use a different key to
# open Vim
bindkey -M vicmd "^V" edit-command-line

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Ruby GC Tuning - https://tunemygc.com/
export RUBY_GC_HEAP_INIT_SLOTS=1166128
export RUBY_GC_HEAP_FREE_SLOTS=3498384
export RUBY_GC_HEAP_GROWTH_FACTOR=1.03
export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=466451
export RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=1.2
export RUBY_GC_MALLOC_LIMIT=76800000
export RUBY_GC_MALLOC_LIMIT_MAX=138240000
export RUBY_GC_MALLOC_LIMIT_GROWTH_FACTOR=1.32
export RUBY_GC_OLDMALLOC_LIMIT=153068509
export RUBY_GC_OLDMALLOC_LIMIT_MAX=275523316
export RUBY_GC_OLDMALLOC_LIMIT_GROWTH_FACTOR=1.2

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm automatic version switch. https://medium.com/@kinduff/automatic-version-switch-for-nvm-ff9e00ae67f3
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH="/usr/local/opt/gettext/bin:$PATH"

if [ -e "$ZSHRC_PATH/zshrc.local" ]; then
    source "$ZSHRC_PATH/zshrc.local"
fi

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

# keychain
/usr/local/bin/keychain $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOST-sh
