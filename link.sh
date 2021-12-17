#!/bin/bash

ln -s $(pwd)/.gitconfig ~
ln -s $(pwd)/.tmux.conf ~
ln -s $(pwd)/.vimrc ~
cp $(pwd)/.npmrc ~
echo 'source ~/dotfiles/.zshrc' > ~/.zshrc
