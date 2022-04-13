#!/bin/sh

set -e

export EDITOR='code --wait'

rm ~/.bashrc

ln -s $PWD/git/.gitconfig        ~/.gitconfig
ln -s $PWD/git/.gitignore_global ~/.gitignore_global
ln -s $PWD/shell/.bashrc         ~/.bashrc