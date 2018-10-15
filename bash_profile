# https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
if [[ -n "$TMUX" && -f /etc/profile ]]; then
    PATH=""
    source /etc/profile
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
