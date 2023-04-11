#! /bin/sh

files=".alias .vimrc .zshrc .p10k.zsh"

echo "Creating ~/dotfiles_old for backup of existing dotfiles..."
mkdir -p ~/dotfiles_old

echo "Changing to ~/dotfiles..."
cd ~/dotfiles

# relocate existing dotfiles to dotfiles_old, then create symlink from ~ files to $files
echo "Relocating existing dotfiles to ~/dotfiles_old..."
for file in $files;
do
    mv ~/$file ~/dotfiles_old
    echo "Copying $file to ~ from ~/dotfiles..."
    cp ~/dotfiles/$file ~/$file
done

