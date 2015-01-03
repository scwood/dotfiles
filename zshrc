# General settings
# -----------------------------------------------------------------------------

# Allow local custimization through .zshrc_local 
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# Auto cd into directories with just directory name
setopt autocd

# Spellcheck
setopt correctall

# Add my bin to PATH
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

# Prompt 
# -----------------------------------------------------------------------------

# Allow functions in prompt 
setopt PROMPT_SUBST

# Source git options
source ~/.zsh/git-prompt.sh

# Show git branch dirty state
GIT_PS1_SHOWDIRTYSTATE=1

# Show git untracked state
GIT_PS1_SHOWUNTRACKEDFILES=1

# Name 
PS1=$'%n at '

# Machine name
PS1+=$'%m in '

# Curent directory
PS1+=$'%~'

# Branch info and arrow for looks
PS1+=$'$(__git_ps1)
→ '

# Aliases
# -----------------------------------------------------------------------------

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

# Functions
# -----------------------------------------------------------------------------

# Hide dot files
hide() {
	defaults write com.apple.finder AppleShowAllFiles NO
	killall -KILL Finder
}

# Show dot files
show() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall -KILL Finder
}

# Livestreamer shortcut
watch() {
    if [ -z "$1" ]; then
        echo No stream name given.
        return
    fi
    if [ -z "$2" ]; then
        livestreamer twitch.tv/$1 best
        return
    fi
    livestreamer twitch.tv/$1 $2
}

# mkdir and cd into after
mkcd() { 
	mkdir "$1" && cd "$1"; 
}

# ls after cd
cs() {
	cd $1
	ls
}

# Github add all, commit all, push all
gpush() {
    git add --all
    git commit -m "$1"
    git push origin master
}
