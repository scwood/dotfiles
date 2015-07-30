dir=~/dotfiles
backup_dir=~/.dotfiles_backup

files="
bash_profile
bashrc
gitignore_global 
hammerspoon
inputrc
livestreamerrc 
vimrc"

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
echo "Setting up global gitignore..."
git config --global core.excludesfile '~/.gitignore_global'
echo "Finished"
echo

if [ ! -e ~/.git-prompt.sh ]; then
  echo "Downloading git prompt ..."
  curl -o ~/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  echo "Finished"
  echo
fi

echo "Downloading VIM Plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Finished"
echo
