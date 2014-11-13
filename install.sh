#!/bin/bash
./makesymlinks.sh
vim +BundleInstall +qall
cd vim/bundle/YouCompleteMe/
./install.sh
