#!/bin/bash

declare -a dotfiles=(.bash_profile .bashrc .vimrc .zshrc)

function move_dots {
    for f in "${dotfiles[@]}"; do
        cp $1$f $2$f;
    done
}

function move_dots_temp {
    for f in "${dotfiles[@]}"; do
        cp "$1$f" "$2$f";
    done
}

if [ "$1" = "install" ]; then
    echo "moving dot files from src into the system" 
    move_dots "$HOME/" "cache/"
    move_dots "src/" "$HOME/"

elif [ "$1" = "loadfromsys" ]; then
    echo "moving dot files from system into src"
    move_dots "src/" "cache/"
    move_dots "$HOME/" "src/"

elif [ "$1" = "loadcache" ]; then
    echo "moving dot files from this cache into the system" 
    move_dots_temp "$HOME/" "cache/.tmp"
    move_dots "cache/" "$HOME/"
    move_dots "cache/.tmp" "cache/"
fi

