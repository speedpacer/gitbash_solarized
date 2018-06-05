#!/bin/sh

# back up existing files
mv ~/.bashrc ~/.bashrc_bkp
mv ~/.vimrc ~/.vimrc_bkp
mv ~/.dir_colors ~/.dir_colors

# create folder for vim colors
mkdir -p ~/.vim/colors

# copy files
cp .bashrc ~/.bashrc
cp .vimrc ~/.vimrc
cp .dir_colors ~/.dir_colors
cp solarized.vim ~/.vim/colors

# source .bashrc
. ~/.bashrc

