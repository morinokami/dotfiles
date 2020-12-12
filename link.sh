#!/bin/bash

ln -s $(pwd)/.gitconfig ~
ln -s $(pwd)/.tmux.conf ~
ln -s $(pwd)/.vimrc ~
echo 'source ~/dotfiles/.zshrc' > ~/.zshrc
