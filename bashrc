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
PS1="\u@\h: ${blue}\w${reset}"
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  PS1+="${green}\$(__git_ps1)${reset}"
fi
PS1+='\n$ '

stty -ixon # enable ctrl-s and ctrl-q
bind Space:magic-space # magic space!
export HISTCONTROL=ignoredups # ingore duplicates in history

# -----------------------------------------------------------------------------
# aliases
# -----------------------------------------------------------------------------

alias dot='cd ~/dotfiles'

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
alias gpob='gitPushBranchToOrigin'
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

# cd into the directory of the selected file
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# switch git branches
fbr() {
  local branches=$(git branch)
  local branch=$(echo "$branches" |
    fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m)
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# switch tmux sessions
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
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
    -e FORCE_IMAGE_REMOVAL=1 spotify/docker-gc
}

serve() {
  docker rm -f nginx
  docker run -d -p 9000:80 --name nginx -v $1:/usr/share/nginx/html:ro nginx
}

gitPushBranchToOrigin() {
  local branch=$(git name-rev --name-only HEAD)
  git push origin $branch
}

# -----------------------------------------------------------------------------
# local config
# -----------------------------------------------------------------------------

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi
