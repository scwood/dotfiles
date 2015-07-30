# allow local config
if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

# read OS name
os="$(uname)"

# prompt 
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  PS1='\u@\h: \w \[\033[34m\]$(__git_ps1)\[\033[0m\]\n$ '
else
  PS1='\u@\h: \w \n$ '
fi

# add ~/bin to the path
export PATH=$PATH:$HOME/bin

# OS X specific aliases
if [[ $os == 'Darwin' ]]; then
  alias l='ls -F -G'
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
alias gc='git clone'
alias gcm='git commit -m'
alias gd='git diff'
alias gpo='git push origin'
alias gs='git status'
alias gca='git commit --amend'

# config file shortcuts 
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bshrc'

# show hidden files/directories in finder
showHidden() {
  if [[ $os == 'Darwin' ]]; then
    defaults write com.apple.finder AppleShowAllFiles YES
    killall -KILL Finder
  else
    echo "Not on Darwin"
  fi
}

# hide hidden files/directories in finder
hideHidden() {
  if [[ $os == 'Darwin' ]]; then
    defaults write com.apple.finder AppleShowAllFiles NO
    killall -KILL Finder
  else
    echo "Not on Darwin"
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
