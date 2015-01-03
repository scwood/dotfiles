# Dotfiles

My personal config files for zsh, vim, tmux, and more.

![](https://cloud.githubusercontent.com/assets/9126138/5601806/d2278b0c-92d7-11e4-9c13-fef0d6df544b.png)

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
