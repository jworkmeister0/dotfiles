#!/bin/bash

echo "install git, vim and prezto first!"

echo "vim stuff"
mkdir ~/.vim
mkdir ~/.vim/backup
mkdir ~/.vim/undos
mkdir ~/.vim/swap

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln aliases ~/.aliases
ln vimrc ~/.vimrc
ln tmux ~/.tmux.conf

ln prompt_super_setup ~/.zprezto/modules/prompt/functions/prompt_super_setup

echo "installing vim plugins"
vim +PluginInstall +qall

cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
