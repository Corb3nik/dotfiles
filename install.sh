#!/bin/bash

dotfiles=(
  aliases bash_prompt exports
  tmux.conf vimrc aliases.local
  bash_colors bashrc vim
)

echo "[*] Downloading dependencies..."
git submodule init
git submodule update --recursive

echo "[*] Backing up existing dotfiles..."
d=`date +%s`
folder="$HOME/dotfiles_backup_$d"
mkdir $folder
for f in ${dotfiles[@]}; do
  mv $HOME/.$f $folder 2>/dev/null
done
echo "[*] Backup located at $folder"

echo "[*] Linking new dotfiles..."
curr_folder=`pwd`
for f in ${dotfiles[@]}; do
  cp -R $curr_folder/$f $HOME/.$f
done
echo "[*] Done"

