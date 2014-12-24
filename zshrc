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

# Use vim as editor
export VISUAL=vim

# Add my bin to PATH
path+=('~/bin')
export path

# History
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

# Prompt 
setopt PROMPT_SUBST
source ~/.zsh/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT=$'
%n @ %m: %~%{$fg_bold[magenta]%}$(__git_ps1)%{$reset_color%}
→ '
RPROMPT='%t'

# Aliases
# -----------------------------------------------------------------------------

# Pull OS name
OS="$(uname)"

# OSX specific aliases
if [[ $OS == 'Darwin' ]]; then
    alias l='ls -F -G'
    alias ls='ls -F -G'
    alias ll='ls -F -G -h -l'
    alias la='ls -A -F -G'
    alias lal='ls -A -F -G -h -l'

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

# Sublime
alias subl='sublime'

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

# Unhide dot files
unhide() {
	defaults write com.apple.finder AppleShowAllFiles YES
	killall -KILL Finder
}

# Livestreamer shortcut
watch() {
    livestreamer twitch.tv/$1
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

# Github all in one push
push() {
    git add --all
    git commit -m "$1"
    git push origin master
}
