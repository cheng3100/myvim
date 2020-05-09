#! /bin/bash

#TODO 检查cscope是否存在，若不存在则询问是否安装cscope并解压安装
TEST_CSCOPE=$(cscope -V >/dev/null 2>&1)
if [ $? -ne 0 ];then
    TEST_CSCOPE=1
else
    TEST_CSCOPE=0
fi

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

function install_cscope {
    echo "install the cscope ...."
    cd tools
if [ ! -d ~/bin ];then
    mkdir -p ~/bin
fi
#tar -xzvf cscope-15.9.tar.gz
tar -xzvf cscope-15.8b.tar.gz
cd cscope-15.8b

sh ./configure --prefix=$HOME/bin >/dev/null 2>&1
make > /dev/null 2>&1
make install > /dev/null 2>&1
#echo "export PATH=$PATH:$HOME/bin/bin" >> $HOME/.bashrc
#source $HOME/.bashrc
cd ../../
    echo "cscope has been installed!" 
}

if [ $1 = "cs" ];then
    install_cscope
fi
if [ $1 = "install" ]; then
    if [ $TEST_CSCOPE -eq 1 ];then
        echo "It seems that you have not install cscope"
        echo "Cscope is must for search function"
        echo "Do you want to install it?[yes/no]"
        read -t 60 answer

        case $answer in 
            y|Y|yes|YES|Yes)
                install_cscope
                ;;
            *)
                echo "You still can use vim but the search function will be unusable.."
                ;;
        esac
    fi        
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

