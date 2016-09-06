#!/bin/bash

echo "install git, vim, npm, python and prezto first!"

echo "making vim dirs"
mkdir ~/.vim
mkdir ~/.vim/backup
mkdir ~/.vim/undos
mkdir ~/.vim/swap

echo "instlling Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "aliases, vimrc, tmux"
ln aliases ~/.aliases
ln vimrc ~/.vimrc
ln tmux ~/.tmux.conf
ln jack.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/jack.vim

echo "linking custom prompt"
ln prompt_super_setup ~/.zprezto/modules/prompt/functions/prompt_super_setup

echo "installing vim plugins"
vim +PluginInstall +qall

cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make

cd ~/.vim/bundle/tern_for_vim
npm install

echo "INSTALLING YouCompleMe"
echo "YOU NEED THESE PACKAGES:"
echo "automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel"
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --tern-completer
