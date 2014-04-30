#!/usr/bin/env bash

function dfcopy() {
    for i in .*; do
        [ -f $i ] && cp -rfv $i $HOME
    done
}

if [ -d $HOME/.dotfiles ]; then
    cd $HOME/.dotfiles
    git pull origin master
    dfcopy
else
    git clone https://github.com/eprev/dotfiles.git $HOME/.dotfiles
    if [ -f $HOME/.bash_profile ] || [ -h $HOME/.bash_profile ]; then
        mv $HOME/.bash_profile $HOME/.bash_profile.before-dotfiles;
    fi
    if [ -f $HOME/.bashrc ] || [ -h $HOME/.bashrc ]; then
        mv $HOME/.bashrc $HOME/.bashrc.before-dotfiles;
    fi
    cd $HOME/.dotfiles
    dfcopy
    mkdir -p $HOME/.vim/backups
    mkdir -p $HOME/.vim/swaps
    mkdir -p $HOME/.vim/undo
fi

unset dfcopy
source $HOME/.bash_profile