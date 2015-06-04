dir=~/dotfiles
backup_dir=~/.dotfiles_backup

files="
gitignore_global 
hammerspoon
livestreamerrc 
slate
tmux.conf 
tmux.osx.conf 
tmux.reset.conf
vim 
vimrc
vrapperrc
zsh 
zshrc"

echo
echo "Creating $backup_dir for backup of existing dotfiles"
mkdir -p $backup_dir
rm -rf $backup_dir/*
echo

for file in $files; do
  if [ -a ~/.$file ]; then
    echo "Backing up .$file"
    cp ~/.$file $backup_dir 2> /dev/null
    rm ~/.$file 2> /dev/null
  fi
done

for file in $files; do
  echo "Symlinking .$file"
  ln -sf $dir/$file ~/.$file 2> /dev/null
done

echo
echo "Updating ~/dotfiles submodules"
git submodule update --init --recursive
echo "Finished"
echo
