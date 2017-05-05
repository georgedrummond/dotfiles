set -e
#
# Install homebrew and dependencies
#
if ! type "brew" > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/bundle
brew bundle

#
# Set default gems for rbenv
#
ln -sf ~/dotfiles/rbenv/default-gems $(rbenv root)/default-gems

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
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#
# Dracula theme for iterm2
#
mkdir -p ~/.iterm
if [ ! -e ~/.iterm/dracula ]; then
  git clone https://github.com/dracula/iterm.git ~/.iterm/dracula
fi

#
#
# Install tmuxinator
#
gem install tmuxinator

# Install vundle
#
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim -c ":PluginInstall!" -c ":qa!" ~/.vimrc

