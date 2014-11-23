#!/bin/bash
./makesymlinks.sh
git submodule update --init --recursive
vim +BundleInstall +qall
cd vim/bundle/YouCompleteMe/
./install.sh
