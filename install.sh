set -e

Running() {
  echo "----> $1"
}

PrettyOutput() {
  sed 's/^/      /' $1
}

# Install homebrew and dependencies

    if ! type "brew" > /dev/null; then
      echo "* Installing homebrew"
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    Running "Tapping homebrew/bundle"
    brew tap homebrew/bundle | PrettyOutput

    Running "Installing Homebrew Packages"
    brew bundle | PrettyOutput #sed 's/^/      /'

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
    stow git
    stow pow
    stow ruby
    stow shell
    stow tmux
    stow tmuxinator
    stow vim
    stow zsh

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

    mkdir -p ~/.iterm
    if [ ! -e ~/.iterm/dracula ]; then
      git clone https://github.com/dracula/iterm.git ~/.iterm/dracula | PrettyOutput
    else
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
    vim -c ":PluginInstall!" -c ":qa!" ~/.vimrc
