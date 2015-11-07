#!/usr/bin/env sh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles
olddir=$HOME/dotfiles_old
files="vimrc vim nvimrc nvim gvimrc pentadactyl pentadactylrc emacs.d zshrc \
  xkb xmonad"

##########

# create dotfiles_old in homedir
echo -n "Creating backup directory $olddir"
mkdir -p $olddir

for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv $HOME/.$file $HOME/dotfiles_old/
  echo "Creating symlink to $file in home directory"
  ln -s $dir/$file $HOME/.$file
done

xmonad --recompile

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/xmonad/lib $HOME/dotfiles/xmonad/taffybar/
ln -s $HOME/dotfiles/xmonad/taffybar $HOME/.config/
