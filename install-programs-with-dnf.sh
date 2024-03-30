#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "Run script with sudo."
exit 1
fi

dnf -y install openssh \
    kitty \
    zsh \
    neovim \
    tmux \


