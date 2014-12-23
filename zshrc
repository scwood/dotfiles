# General Settings
# -----------------------------------------------------------------------------

# Allow local custimization through .zshrc_local 
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# Auto cd
setopt autocd

# Spellcheck
setopt correctall

# Use vim as editor
export VISUAL=vim

# Add my bin to PATH
path+=('/Users/spencer/bin')
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

# General commands
alias ..='cd ..'
alias ~='cd ~'
alias c='clear'
alias e='exit'

# Easy .zshrc reload
alias reload='source ~/.zshrc'

# School SSH
alias byu='ssh scwood@schizo.cs.byu.edu'

# Sublime
alias subl='sublime'

# Git aliases
alias ga='git add --all'
alias gcm='git commit -m'
alias gpom='git push origin master'
alias cdgr='cd "$(git rev-parse --show-toplevel)"'
alias gs='git status'

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
