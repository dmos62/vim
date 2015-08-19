#!/bin/bash

echo "renaming vim directory to .vim ..."
mkdir ~/.vim
cp -al ~/vim/. ~/.vim && rm -rf ~/vim

echo "linking ~/.vim/.vimrc to ~/.vimrc ..."
ln -s ~/.vim/.vimrc ~/.vimrc

echo "initializing vim's git submodules"
git submodule init
git submodule update
