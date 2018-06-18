#!/bin/sh

# back up existing files
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc_bkp
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc_bkp
[ -f ~/.minttyrc ] && mv ~/.minttyrc ~/.minttyrc_bkp
[ -f ~/.dir_colors ] && mv ~/.dir_colors ~/.dir_colors_bkp
[ -f ~/.vim/colors/solarized.vim ] && mv ~/.vim/colors/solarized.vim ~/.vim/colors/solarized.bkp

# create folder for vim colors
[ ! -d ~/.vim/colors ] && mkdir -p ~/.vim/colors

# copy files
cp .bashrc ~/.bashrc
cp .vimrc ~/.vimrc
cp .minttyrc ~/.minttyrc
cp .dir_colors ~/.dir_colors
cp solarized.vim ~/.vim/colors

# source .bashrc
. ~/.bashrc

