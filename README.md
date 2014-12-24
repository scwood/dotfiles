# Dotfiles

Some dotfiles that you could use if you really wanted to.

![](https://cloud.githubusercontent.com/assets/9126138/5551512/f7a09320-8b8d-11e4-8a11-4bab69b45d43.png)

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

### For VIM

Install [Vundle](https://github.com/gmarik/Vundle.vim):

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Next time VIM is opened, run `:PluginInstall`.
