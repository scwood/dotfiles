# -----------------------------------------------------------------------------
# general
# -----------------------------------------------------------------------------

export PLATFORM=$(uname)
export PATH="$PATH:$HOME/bin:/usr/local/sbin"

# prompt
green="\[\033[32m\]"
blue="\[\033[34m\]"
reset="\[\033[0m\]"
PS1="\u@\h: ${blue}\W${reset}"
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  PS1+="${green}\$(__git_ps1)${reset}"
fi
PS1+=' $ '

stty -ixon # enable ctrl-s and ctrl-q
bind Space:magic-space # magic space!
export HISTCONTROL=ignoredups # ingore duplicates in history

# -----------------------------------------------------------------------------
# aliases
# -----------------------------------------------------------------------------

alias dot='cd ~/dotfiles'
alias notes='cd ~/notes'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias brc='vim ~/dotfiles/bashrc'
alias trc='vim ~/dotfiles/tmux.conf'
alias vrc='vim ~/dotfiles/vimrc'

alias tas='tmux attach-session -t'
alias tks='tmux kill-session -t'
alias tns='tmux new-session -s'

alias cdgr='cd "$(git rev-parse --show-toplevel)"'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbd='git branch -d'
alias gc='git commit'
alias gca='git commit --amend'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias gd='git diff'
alias gmnff='git merge --no-ff'
alias gpom='git push origin master'
alias gs='git status'
alias gsu='git status -uno'

if [[ "$PLATFORM" == 'Darwin' ]]; then
  alias l='ls -FG'
  alias ls='ls -FG'
  alias la='ls -aFG'
  alias ll='ls -FGhl'
  alias lla='ls -aFGhl'
fi

# -----------------------------------------------------------------------------
# fzf - fuzzy finder for your shell: https://github.com/junegunn/fzf
# -----------------------------------------------------------------------------

if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
fi

# cd into the directory of the selected file through fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# change git branches with fzf
fbr() {
  local branches=$(git branch)
  local branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m)
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# switch tmux-sessions with fzf
fs() {
  local sessions=$(tmux list-sessions -F "#{session_name}")
  local selection=$(echo "$sessions" | fzf-tmux --select-1 --exit-0)
  tmux switch-client -t "$selection" || tmux attach -t "$selection"
}

# -----------------------------------------------------------------------------
# general functions
# -----------------------------------------------------------------------------

if [ "$PLATFORM" = 'Darwin' ]; then

  showHidden() {
    defaults write com.apple.finder AppleShowAllFiles YES
    killall -KILL Finder
  }

  hideHidden() {
    defaults write com.apple.finder AppleShowAllFiles NO
    killall -KILL Finder
  }

fi

dockerCleanup() {
  docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc:/etc spotify/docker-gc
}

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

syncNotes() {
  cd ~/notes
  git add .
  git commit -m 'Syncing'
  git push origin master
  cd -
}

# -----------------------------------------------------------------------------
# local config
# -----------------------------------------------------------------------------

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
