#!/usr/bin/env bash

if [ -d $HOME/.dotfiles ]; then
    cd $HOME/.dotfiles
    git pull origin master
else
    git clone https://github.com/eprev/dotfiles.git $HOME/.dotfiles
    pushd .dotfiles
    popd
    if [ -f $HOME/.bashrc ] || [ -h $HOME/.bashrc ]; then
        mv $HOME/.bashrc $HOME/.bashrc.before-dotfiles;
    fi
    echo "source ~/.dotfiles/bashrc" > $HOME/.bashrc
    ln -siv .dotfiles/bash_profile .bash_profile
    ln -siv .dotfiles/gitconfig .gitconfig
    ln -siv .dotfiles/gitignore .gitignore
    ln -siv .dotfiles/inputrc .inputrc
    ln -siv .dotfiles/tmux.conf .tmux.conf
    ln -siv .dotfiles/vim .vim
    ln -siv .dotfiles/vimrc .vimrc
    ln -siv .dotfiles/ctags .ctags
fi

source $HOME/.bash_profile
