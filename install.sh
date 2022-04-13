#!/bin/sh

set -e

export EDITOR="code --wait"

alias bb='bundle install'
alias bc='bundle exec rails console'
alias be='bundle exec'
alias br='bundle exec rspec'
alias bs='bundle exec rails server'
alias cdh='cd ~'
alias gap='git add -p'
alias gcm='git commit -m'
alias gdabem='git branch | grep -v "master" | xargs git branch -D'
alias gdm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gho='hub browse'
alias gnb='git checkout -b'
alias guc='git reset --soft HEAD~1'
gsq() { git rebase -i HEAD~"$@" }

ln -svf git/.gitconfig ~/.gitconfig
ln -svf git/.gitignore_global ~/.gitignore_global