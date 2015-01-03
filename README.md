# Dotfiles

My personal config files for zsh, vim, tmux, and more.

![](https://cloud.githubusercontent.com/assets/9126138/5601808/4263699a-92d8-11e4-8160-1c7774fed23f.png)

## Installation

```
cd ~
git clone --recursive https://github.com/scwood/dotfiles.git
```

Symlinking is handled via [Dotbot](https://github.com/anishathalye/dotbot):
  
```
cd ~/dotfiles
./install
```

### For VIM plugins

Install [Vundle](https://github.com/gmarik/Vundle.vim):

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Next time VIM is opened, run `:PluginInstall`.
