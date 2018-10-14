#! /bin/bash

if [ $1 = "update" ]; then
    tar -czvf vim_plugin.tar.gz -C ~ .vim 
    cp ~/.vimrc .vimrc
fi

if [ $1 = "install" ]; then
    tar -xzvf vim_plugin.tar.gz
    if [ -d ~/.vim ];then
        tar -czvf vim_plugin.back.tar.gz -C ~ .vim
        rm -rf ~/.vim
    fi
    if [ -d ~/.vimrc ];then
        mv ~/.vimrc ~/.vimrc.back
        rm -f ~/.vimrc
    fi
    cp -rf .vim ~/.vim
    cp -f  .vimrc ~/.vimrc
    rm -rf .vim
fi