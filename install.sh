#!/bin/bash

dir=~/dotfiles
backup_dir=~/.dotfiles_backup

files="
bash_profile
bashrc
ideavimrc
inputrc
tmux.conf
vimrc"

echo
echo "Creating backup directory at $backup_dir"
mkdir -p $backup_dir
echo

for file in $files; do
  if [ -a ~/.$file ]; then
    echo "Backing up .$file"
    now=`date '+%Y-%m-%d_%H:%M:%S'`
    cp ~/.$file $backup_dir/$file\_$now 2> /dev/null
    rm ~/.$file 2> /dev/null
  fi
done

echo

for file in $files; do
  echo "Symlinking .$file"
  ln -sf $dir/$file ~/.$file 2> /dev/null
done

echo
echo "Configuring git..."
git config --global core.editor /usr/bin/vim
git config user.email "spencercwood@gmail.com"
git config user.name "Spencer Wood"
echo "Finished"
echo

if [ ! -e ~/.git-prompt.sh ]; then
  echo "Downloading git prompt..."
  curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  echo "Finished"
  echo
fi

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  echo "Downloading Vim Plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Finished"
  echo
fi

echo "Installing Vim plugins..."
vim +PlugInstall +qall
echo "Finished"
echo

echo "Installing Tmux plugin manager..."
if [ ! -e ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Finished"
echo "To install Tmux plugins launch tmux and press 'C-a I'"
