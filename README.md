# Dotfiles

Some mediocre dotfiles that you could use if you really wanted to.

![](http://i.imgur.com/YDSXvdu.png)

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

Install [Vundle](https://github.com/gmarik/Vundle.vim):

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Next time VIM is opened, run `:PluginInstall`.
