# -----------------------------------------------------------------------------
# general
# -----------------------------------------------------------------------------

# allow local config
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# prompt
PS1='\u@\h: \[\033[34m\]\w\[\033[0m\]'
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    PS1+='\[\033[32m\]$(__git_ps1)\[\033[0m\]'
fi
PS1+='\n$ '

# add ~/bin to the path
export PATH=$PATH:$HOME/bin

# get OS
export PLATFORM=$(uname)

# enable ctrl-s and ctrl-q
stty -ixon

# -----------------------------------------------------------------------------
# aliases
# -----------------------------------------------------------------------------

alias dot='cd ~/dotfiles'

# OS X specific aliases
if [[ "$PLATFORM" == 'Darwin' ]]; then
    alias ls='ls -F -G'
    alias la='ls -A -F -G'
    alias ll='ls -F -G -h -l'
    alias lla='ls -A -F -G -h -l'
fi

# git aliases
alias cdgr='cd "$(git rev-parse --show-toplevel)"'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gd='git diff'
alias gs='git status'
alias gsu='git status -uno'

# config file shortcuts
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias trc='vim ~/.tmux.conf'

# dir aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# -----------------------------------------------------------------------------
# fzf - fuzzy finder for your shell: https://github.com/junegunn/fzf
# -----------------------------------------------------------------------------

# source fzf
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi

# cd into the directory of the selected file through fzf
fcd() {
    local file
    local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# change git branches with fzf
fbr() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# switch tmux-sessions with fzf
fs() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | \
        fzf-tmux --query="$1" --select-1 --exit-0) &&
        tmux switch-client -t "$session"
}

# -----------------------------------------------------------------------------
# general functions
# -----------------------------------------------------------------------------

# show hidden files/directories in finder
showHidden() {
    if [[ $os == 'Darwin' ]]; then
        defaults write com.apple.finder AppleShowAllFiles YES
        killall -KILL Finder
    else
        echo "error: not on Darwin"
    fi
}

# hide hidden files/directories in finder
hideHidden() {
    if [[ $os == 'Darwin' ]]; then
        defaults write com.apple.finder AppleShowAllFiles NO
        killall -KILL Finder
    else
        echo "error: not on Darwin"
    fi
}

# extract function that handles multiple file types
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
