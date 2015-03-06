# Dotfiles

My personal config files for zsh, vim, tmux, and more.

![](https://cloud.githubusercontent.com/assets/9126138/6469751/4c0218be-c19c-11e4-8e0a-bf90c8f9da28.png)

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

If have have conflicting existing files you may have to move them to another directory.

### Vim

Plugins are handled through [vim-plug](https://github.com/junegunn/vim-plug). To install them, run `:PlugInstall` next time Vim is opened.

### iTerm2

Colors and fonts for iTerm2 are stored in dotfiles/iTerm2. Font in screenshot is Inconsolata size 13. 

### Tmux

If you're on OS X and you want the battery indicator in your Tmux status line, download [this script](https://github.com/scwood/Battery/blob/master/battery) and place it somewhere in your shells path, I like $HOME/path which I export in my .zshrc 

If you're not in OS X, you aren't on a laptop, or you just don't want a battery indicator, replace the following line in tmux.conf:

```
set -g status-right "%l:%M %p - %d %b %Y - #(battery -t -p -a)"
```

with:

```
set -g status-right "%l:%M %p - %d %b %Y" 
```

Original credit for the battery script goes to [Goles](https://github.com/Goles).

## License

MIT
