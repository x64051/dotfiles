#!/usr/bin/sh

DOTFILES=$(pwd)

# ~/bin: {{{
mkdir -p ~/bin
FILES=$DOTFILES/bin/*
for f in $FILES
do
    ln -s $f ~/bin
done
# }}}

# fish{{{
mkdir -p ~/.config/fish/functions
ln -s $DOTFILES/fish/config.fish ~/.config/fish/
FILES=$DOTFILES/fish/functions
for f in $FILES
do
    ln -s $f ~/.config/fish
done
# }}}

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

# inputrc, keynavrc, Xresources {{{
ln -s $DOTFILES/inputrc ~/.inputrc
ln -s $DOTFILES/keynavrc ~/.keynavrc
ln -s $DOTFILES/Xresources ~/.Xresources
# }}}

# nvim{{{
mkdir -p  ~/.config/nvim 
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $DOTFILES/nvim/init.vim ~/.config/nvim/init.vim
echo please run :PlugInstall when using nvim next time
#}}}


# st{{{
echo remove all other st installations, then press enter to continue
read 
git clone https://github.com/x64051/xst
cd xst
make
sudo make install
# }}}


# vim:foldmethod=marker
