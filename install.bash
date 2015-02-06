#!/usr/bin/env bash

if [ -d $HOME/.dotfiles ]; then
    cd $HOME/.dotfiles
    git pull origin master
    git submodule init
    git submodule update
else
    git clone https://github.com/eprev/dotfiles.git $HOME/.dotfiles
    pushd .dotfiles
    git submodule init
    git submodule update
    popd
    if [ -f $HOME/.bashrc ] || [ -h $HOME/.bashrc ]; then
        mv $HOME/.bashrc $HOME/.bashrc.before-dotfiles;
    fi
    echo "source ~/.dotfiles/bootstrap.bash" >> $HOME/.bash_profile
    cp $HOME/.dotfiles/bashrc $HOME/.bashrc
    ln -s .dotfiles/gitconfig .gitconfig
    ln -s .dotfiles/gitignore .gitignore
    ln -s .dotfiles/inputrc .inputrc
    ln -s .dotfiles/tmux.conf .tmux.conf
    ln -s .dotfiles/vim .vim
    ln -s .dotfiles/vimrc .vimrc
    # Install locationchanger
    mkdir -p /usr/local
    ln -s $HOME/.dotfiles/bin/locationchanger /usr/local/bin/locationchanger
fi

source $HOME/.bash_profile
