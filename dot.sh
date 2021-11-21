#!/bin/bash

declare -a dotfiles=(.bash_profile .bashrc .gitconfig .tmux.conf .vimrc .zshrc .torc .oh-my-zsh\/)

function move_dots {
    echo ""
    echo "moving files/directories from $1 to $2"
    for f in "${dotfiles[@]}"; do
        if [ -d $1$f ]; then
          echo "$1$f* ---> $2$f"
          mkdir -p $2$f;
          cp -r $1$f* $2$f;
        else
          echo "$1$f ---> $2$f"
          cp -r $1$f $2$f;
        fi
    done
}

function move_dots_temp {
    echo ""
    echo "moving files from $1 to $2"
    for f in "${dotfiles[@]}"; do
        echo "$1$f ---> $2$f"
        cp -r "$1$f" "$2$f";
    done
}

mkdir -p "cache/"

if [ "$1" = "install" ]
then
    move_dots "$HOME/" "cache/"
    move_dots "src/" "$HOME/"
    echo ''

    VUNDLE_DIR=~/.vim/bundle/Vundle.vim
    if [[ -d $VUNDLE_DIR ]]; then
      echo "removing vundle installation"
      rm -rf $VUNDLE_DIR
    fi
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo ''
    echo 'install zsh plugins'
    PLUGIN_DIR=~/.oh-my-zsh/custom/plugins
    mkdir -p $PLUGIN_DIR
    git clone https://github.com/zdharma/fast-syntax-highlighting $PLUGIN_DIR/fast-syntax-highlighting

    echo ''
    echo 'installation complete...'
    echo '1. open vim and run the command `:PluginInstall`'
    echo '2. start zsh (`exec zsh`)'
elif [ "$1" = "loadfromsys" ]
then
    move_dots "src/" "cache/"
    move_dots "$HOME/" "src/"
elif [ "$1" = "loadcache" ]
then
    move_dots_temp "$HOME/" "cache/.tmp"
    move_dots "cache/" "$HOME/"
    move_dots "cache/.tmp" "cache/"
else
    echo "valid usage: "
    echo ""
    echo "  ./dot.sh install"
    echo "      - installs dot files from src into the system"
    echo "      - downloads and sets up environmental dependencies (e.g. ohmyzsh)"
    echo ""
    echo "  ./dot.sh loadfromsys"
    echo "      - loads the current systems dot files into src"
    echo ""
    echo "  ./dot.sh recover"
    echo "      - recovers dotfiles from system which were overwritten during the last install"
fi