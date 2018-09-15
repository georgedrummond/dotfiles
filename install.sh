set -e

Running() {
  echo "----> $1"
}

PrettyOutput() {
  sed 's/^/      /' $1
}

#
# Make sure we have most recent version of the repo
#

    Running "Updating dotfiles repo"
    git pull | PrettyOutput

#
# Install homebrew and dependencies
#

    if ! type "brew" > /dev/null; then
      Running "Installing homebrew"
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    Running "Update Homebrew and Cask"
    brew upgrade | PrettyOutput
    brew cask upgrade | PrettyOutput

    Running "Tapping homebrew/bundle"
    brew tap homebrew/bundle | PrettyOutput

    Running "Installing Homebrew Packages"
    brew bundle | PrettyOutput

    Running "Cleaning up Homebrew"
    brew cleanup | PrettyOutput
    brew cask cleanup | PrettyOutput

#
# Set default gems for rbenv
#

    Running "Symlinking rbenv/default-gems"
    ln -sf ~/dotfiles/rbenv/default-gems $(rbenv root)/default-gems

#
# Symlink all dotfiles
#

    Running "Symlinking all dotfiles with stow"
    stow ack
    stow bash
    stow completion
    stow git
    stow pow
    stow ruby
    stow shell
    stow tmux
    stow tmuxinator
    stow vim
    stow zsh

#
# Fix nodebrew src path
#

    Running "Fixing nodebrew build path"
    mkdir -p ~/.nodebrew/src

#
# Install oh-my-zsh
#

    Running "Installing oh-my-zsh"
    if [ ! -e ~/.oh-my-zsh ]; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

#
# Dracula theme for iterm2
#

    Running "Making iterm styles directory"
    mkdir -p ~/.iterm

    if [ ! -e ~/.iterm/dracula ]; then
      Running "Installing iterm dracula theme"
      git clone https://github.com/dracula/iterm.git ~/.iterm/dracula | PrettyOutput
    else
      Running "Updating iterm dracula theme"
      cd ~/.iterm/dracula && git pull | PrettyOutput
    fi

#
# Install tmuxinator
#

    Running "gem install tmuxinator"
    gem install tmuxinator | PrettyOutput

#
# Install vundle
#

    Running "Install vundle"
    if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim | PrettyOutput
    else
      cd ~/.vim/bundle/Vundle.vim && git pull | PrettyOutput
    fi

    Running "vimrc :PluginInstall"
    vim -c ":PluginInstall!" -c ":qa!" ~/.vimrc

#
# Install prettier
#

    Running "npm install -g prettier"
    npm install -g prettier | PrettyOutput

#
# Set screenshots folder
#
    Running "Set screenshots folder"
    mkdir -p ~/Desktop/screenshots
    defaults write com.apple.screencapture location ~/Desktop/screenshots
    killall SystemUIServer
