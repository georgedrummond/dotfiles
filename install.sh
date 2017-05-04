#
# Install homebrew and dependencies
#
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/bundle
brew bundle

#
# Symlink all dotfiles
#
stow ack
stow bash
stow git
stow pow
stow shell
stow tmux
stow tmuxinator
stow vim
stow zsh

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
#
# Install tmuxinator
#
gem install tmuxinator

# Install vundle
#
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall!" -c ":qa!" ~/.vimrc

