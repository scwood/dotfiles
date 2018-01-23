# -----------------------------------------------------------------------------
# general
# -----------------------------------------------------------------------------

export PLATFORM=$(uname)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

green="\[\033[32m\]"
blue="\[\033[34m\]"
reset="\[\033[0m\]"
PS1="${blue}\$(truncatedPwd)${reset}"
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
alias sb='source ~/.bashrc'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias brc='vim ~/dotfiles/bashrc'
alias trc='vim ~/dotfiles/tmux.conf'
alias vrc='vim ~/dotfiles/vimrc'

alias tas='tmux attach-session -t'
alias tks='tmux kill-session -t'

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
alias gpob='git push origin $(getCurrentGitBranch)'
alias gs='git status'
alias gsu='git status -uno'

if [[ "$PLATFORM" == 'Darwin' ]]; then
  alias l='ls -FG'
  alias ls='ls -FG'
  alias la='ls -aFG'
  alias ll='ls -FGhl'
  alias lla='ls -aFGhl'
elif [[ "$PLATFORM" == 'Linux' ]]; then
  alias l='ls -F --color=auto'
  alias ls='ls -F --color=auto'
  alias la='ls -aF --color=auto'
  alias ll='ls -Fhl --color=auto'
  alias lla='ls -aFhl --color=auto'
fi

# -----------------------------------------------------------------------------
# fzf - fuzzy finder for your shell: https://github.com/junegunn/fzf
# -----------------------------------------------------------------------------

if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
fi

export FZF_DEFAULT_OPTS='--height 40%'

if hash ag 2>/dev/null; then
  export FZF_DEFAULT_COMMAND='ag --follow -g ""'
fi

# switch git branches
fbr() {
  local branches=$(git branch)
  local branch=$(echo "$branches" |
    fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m)
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# switch tmux sessions
fs() {
  local session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --exit-0)
  tmux attach -t $session || tmux switch -t $session 
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

dockerGc() {
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc \
    spotify/docker-gc
}

serve() {
  docker rm -f nginx
  docker run -d -p 9999:80 --name nginx -v $1:/usr/share/nginx/html:ro nginx
}

getCurrentGitBranch() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  echo $branch;
}

truncatedPwd() {
  local pathLength=$(dirs | grep -o '/' | wc -l)
  if [ $pathLength -gt 3 ]; then
    local front=$(dirs | cut -f 1-3 -d '/')
    local back=$(dirs | rev | cut -f 1 -d '/' | rev)
    echo "$front/.../$back"
  else
    dirs
  fi
}

function softDeleteGitBranches() {
  git branch | grep -vE "(master|stage|\*)" | xargs git branch -d
}

function tns() {
  tmux new-session -s $1; \
    split-window-v $1;
}

function sshProxy() {
  local localPort=$1
  local remoteHost=$2
  local remotePort=$3
  local sshServer=$4
  ssh -N -L $localPort:$remoteHost:$remotePort $sshServer
}

# -----------------------------------------------------------------------------
# local config
# -----------------------------------------------------------------------------

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
