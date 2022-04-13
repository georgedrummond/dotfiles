#!/bin/sh

set -e

export EDITOR='code --wait'

ln -s ./git/.gitconfig ~/.gitconfig
ln -s ./git/.gitignore_global ~/.gitignore_global


if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi