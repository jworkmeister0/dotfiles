#!/bin/bash

echo "install git, vim and oh-my-zsh first!"

echo "vim stuff"
mkdir ~/.vim
mkdir ~/.vim/backup
mkdir ~/.vim/undos
mkdir ~/.vim/swap

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln aliases ~/.aliases
ln vimrc ~/.vimrc
ln tmux ~/.tmux.conf

echo "installing vim plugins"
vim +PluginInstall +qall

