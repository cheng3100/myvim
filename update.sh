#! /bin/bash

#TODO 检查cscope是否存在，若不存在则询问是否安装cscope并解压安装

if [ $# -ne 1 ];then
    echo "Usage: ./update <option>"
    echo "<option>:"
    echo "1. update: update the local to the git resp"
    echo "2. install: install from the git resp to local"
    exit
fi
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
    if [ -f ~/.vimrc ];then
        mv ~/.vimrc vimrc.back
        rm -f ~/.vimrc
    fi
    cp -rf .vim ~/.vim
    cp -f  .vimrc ~/.vimrc
    rm -rf .vim
fi
