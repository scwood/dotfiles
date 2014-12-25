# Dotfiles

Some dotfiles that you could use if you really wanted to.

![](https://cloud.githubusercontent.com/assets/9126138/5552448/647c8800-8bbb-11e4-8157-44ada7e00cb9.png)

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
