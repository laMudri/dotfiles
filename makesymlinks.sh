#!/usr/bin/env sh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles
olddir=$HOME/dotfiles_old
files="vimrc vim nvimrc nvim gvimrc pentadactyl pentadactylrc spacemacs zshrc \
  xkb xmonad tmux.conf zsh"

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

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/xmonad/lib $HOME/dotfiles/xmonad/taffybar/
mv $HOME/.config/taffybar $HOME/dotfiles_old/
ln -s $HOME/dotfiles/xmonad/taffybar $HOME/.config/

ln -s $HOME/.nvim $HOME/.config/nvim
