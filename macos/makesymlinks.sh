#! /bin/sh

files=".alias .ideavimrc .vimrc .zshrc .p10k.zsh"
# TODO: add a directories symlink process for nvim etc.

echo "Creating ~/dotfiles_old for backup of existing dotfiles..."
mkdir -p ~/dotfiles_old

echo "Changing to ~/dotfiles/macos..."
cd ~/dotfiles/macos

# relocate existing dotfiles to dotfiles_old, then copy files from dotfiles to ~
echo "Relocating existing dotfiles to ~/dotfiles_old..."
for file in $files;
do
    touch ~/$file
    mv ~/$file ~/dotfiles_old
    echo "Making symlink to ~/$file from ~/dotfiles..."
    ln -s ~/dotfiles/macos/$file ~/$file
done

