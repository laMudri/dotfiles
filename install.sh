#!/usr/bin/env sh
./makesymlinks.sh
git submodule update --init --recursive
vim +BundleInstall +qall
nvim +BundleInstall +qall
xmonad --recompile
#cd vim/bundle/YouCompleteMe/
#./install.sh
xkbcomp -I$HOME/.xkb ~/.xkb/map.xkb $DISPLAY
