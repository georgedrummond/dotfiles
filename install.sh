#
# Install homebrew and dependencies
#
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
brew bundle

#
# Symlink all dotfiles
#
stow pow
stow zsh
stow tmux
stow vim
stow ack
stow shell

#
# Install oh-my-zsh
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#
# Dracula theme for iterm2
#
mkdir ~/.iterm
git clone https://github.com/dracula/iterm.git ~/.iterm/dracula

#
# Install vundle
#
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall" -c ":wq!" ~/.vimrc

