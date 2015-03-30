# Source fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Allow local custimization through .zshrc_local 
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

# ------------------------------------------------------------------------------
# General settings
# ------------------------------------------------------------------------------

# Auto cd into directories with just directory name
setopt autocd

# Spellcheck
setopt correctall

# Add $HOME/bin to PATH
path+=($HOME/bin)
export path

# History
setopt HIST_IGNORE_DUPS
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

# Autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'm:{-_}={_-}'

# Syntax highlighting
autoload -U colors && colors
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use emacs mode
bindkey -e

# ------------------------------------------------------------------------------
# Prompt 
# ------------------------------------------------------------------------------

# Allow functions in prompt 
setopt PROMPT_SUBST

# Source git options
source ~/.zsh/git-prompt.sh

# Show git branch dirty state
GIT_PS1_SHOWDIRTYSTATE=1

# Show git untracked state
GIT_PS1_SHOWUNTRACKEDFILES=1

# Name 
PS1=$'%n at %m in %2~$(__git_ps1)
→ ' 
# →

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# Pull OS name
OS="$(uname)"

# OSX specific aliases
if [[ $OS == 'Darwin' ]]; then
  alias l='ls -F -G'
  alias ls='ls -F -G'
  alias la='ls -A -F -G'
  alias ll='ls -F -G -h -l'
  alias lla='ls -A -F -G -h -l'

# Linux specific aliases
elif [[ $OS == 'Linux' ]]; then
  alias l='ls --color'
fi

# General commands
alias ..='cd ..'
alias ~='cd ~'
alias c='clear'
alias q='exit'
alias :q='exit'

# Easy .zshrc reload
alias reload='source ~/.zshrc'

# School SSH
alias byu='ssh scwood@schizo.cs.byu.edu'

# Git aliases
alias cdgr='cd "$(git rev-parse --show-toplevel)"'
alias ga='git add'
alias gaa='git add --all'
alias gc='git clone'
alias gcm='git commit -m'
alias gcr='git clone --recursive'
alias gd='git diff'
alias gpom='git push origin master'
alias gs='git status'
alias gsa='git submodule add'

# Vim config file shortcuts 
alias vrc='vim ~/.vimrc'
alias zrc='vim ~/.zshrc'
alias trc='vim ~/.tmux.conf'

# Start vim to allow c-s keybind
alias vim="stty stop '' -ixoff; vim"

# Tmux aliases
alias work='tmux new -s workspace'
alias tks='tmux kill-server'

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

# mkdir and cd into it
mkcd() { 
  mkdir "$1" && cd "$1"; 
}

# ls after cd
cs() {
  cd $1
  ls
}

# fuzzy find and change directories
fd() {
  local dir=$(find * -type d | fzf-tmux)
  cd "$dir"
}

# fuzzy find and open in finder (OSX)
if [[ $OS == 'Darwin' ]]; then
  ff() {
    local target
    target=$(fzf-tmux)
    if [ -z "$target" ]; then
      return
    elif [ ! -d $target ]; then
      target=$(dirname "$target") 
    fi
    open "$target"
  }
fi

# fuzzy find and open file with default open command
fo() {
  local target
  target=$(fzf-tmux)
  if [ -z "$target" ]; then
    return
  fi
  open "$target"
}

# fuzzy find and open in vim
fvim() {
  local file=$(find * -type f | fzf-tmux)
  if [ ! -z "$file" ]; then
    vim "$file"
  fi
}

# Hide hidden files/directories in finder
hide() {
  defaults write com.apple.finder AppleShowAllFiles NO
  killall -KILL Finder
}

# Show hidden files/directories in finder
show() {
  defaults write com.apple.finder AppleShowAllFiles YES
  killall -KILL Finder
}

# Github add all, commit all with a message, and push all
gpush() {
  if [ -z $1 ]; then
    echo "usage: gpush 'commit_message'"
    return
  fi
  git add --all
  git commit -m "$1"
  git push origin master
}

# Extract function that handles multiple file types
extract() {
  if [ -z $1 ]; then
    echo "usage: extract file_name"
    return
  fi
  for f; do
    if [ ! -f "$f" ]; then
      echo "extract $f failed - file does not exist"
    else
      case "$f" in
        *.tar) tar xvf $f;;
        *.tar.gz) tar xvf $f;;
        *.tgz) tar xvf $f;;
        *.zip) unzip $f;;
        *) echo "extract $f failed - unknown archive method"
      esac
    fi
  done
}

# Livestreamer shortcut
watch() {
  if [ -z "$1" ]; then
    echo "usage: watch stream_name [quality]"
  elif [ -z "$2" ]; then
    livestreamer twitch.tv/$1 best
  else
    livestreamer twitch.tv/$1 $2
  fi
}

# generate tmux workspace
tmux-work() {
  tmux new-session -d -s workspace -n editing 
  tmux new-window -t workspace -n testing
  tmux attach -t workspace
}
