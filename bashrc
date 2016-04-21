# -----------------------------------------------------------------------------
# general
# -----------------------------------------------------------------------------

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

export PLATFORM=$(uname)
export PATH="$PATH:$HOME/bin:/usr/local/sbin"

# prompt
green="\[\033[32m\]"
blue="\[\033[34m\]"
reset="\[\033[0m\]"
PS1="\u@\h: ${blue}\w${reset}"
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  PS1+="${green}\$(__git_ps1)${reset}"
fi
PS1+='\n$ '

# enable ctrl-s and ctrl-q
stty -ixon

# -----------------------------------------------------------------------------
# aliases
# -----------------------------------------------------------------------------

alias dot='cd ~/dotfiles'
alias notes='cd ~/notes'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias vrc='vim ~/dotfiles/vimrc'
alias brc='vim ~/dotfiles/bashrc'
alias trc='vim ~/dotfiles/tmux.conf'

alias cdgr='cd "$(git rev-parse --show-toplevel)"'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gd='git diff'
alias gpom='git push origin master'
alias gs='git status'
alias gsu='git status -uno'

if hash nvim &> /dev/null; then
  alias vim='nvim'
fi

if [[ "$PLATFORM" == 'Darwin' ]]; then
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

if [ "$PLATFORM" = 'Darwin' ]; then

  dockerInit() {
    [ $(docker-machine status default) = 'Running' ] || docker-machine start default
    eval "$(docker-machine env default)"
  }

  dockerStop() {
    docker-machine stop default
  }

  showHidden() {
    defaults write com.apple.finder AppleShowAllFiles YES
    killall -KILL Finder
  }

  hideHidden() {
    defaults write com.apple.finder AppleShowAllFiles NO
    killall -KILL Finder
  }

fi

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
