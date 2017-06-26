#!/usr/bin/sh

DOTFILES=$(pwd)

# ├── cmus
# │   └── autosave
# ├── colors
# ├── htop
# │   └── htoprc
# ├── i3
# │   └── config
# ├── i3status
# │   └── config
# ├── inputrc
# ├── install.sh
# ├── keynavrc
# ├── nvim
# │   └── init.vim
# └── Xresources

# cmus {{{
mkdir -p ~/.config/cmus
ln -s $DOTFILES/cmus/rc ~/.config/cmus/
# }}}

# htop {{{
mkdir -p ~/.config/htop
ln -s $DOTFILES/htop/htoprc ~/.config/htop/
# }}}

# i3 {{{
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status/
ln -s $DOTFILES/i3/config ~/.config/i3/config
ln -s $DOTFILES/i3status/config ~/.config/i3status/config
# }}}

# inputrc, keynavrc {{{
ln -s $DOTFILES/inputrc ~/.inputrc
ln -s $DOTFILES/keynavrc ~/.keynavrc
# }}}

# nvim{{{
mkdir -p  ~/.config/nvim 
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $DOTFILES/nvim/init.vim ~/.config/nvim/init.vim
echo please run :PlugInstall when using nvim next time
#}}}

# st{{{

echo TODO: clone st, apply patches, enter colors

# }}}


