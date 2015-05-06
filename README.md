# Dotfiles

My personal config files for zsh, vim, tmux, etc.

![](https://cloud.githubusercontent.com/assets/9126138/6958523/8609cf26-d8ca-11e4-9e23-5e8006560510.png)

## Installation

```
cd ~
git clone https://github.com/scwood/dotfiles.git
cd ~/dotfiles
./install
```

### Vim

Plugins are handled through [vim-plug](https://github.com/junegunn/vim-plug). To install them, run `:PlugInstall` next time Vim is opened.

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
