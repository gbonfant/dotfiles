#!/bin/sh

echo "Linking files..."
cd ~
ln -sf dotfiles/bashrc      .bashrc
ln -sf dotfiles/gitconfig   .gitconfig
ln -sf dotfiles/tmux.conf   .tmux.conf
ln -sf dotfiles/vimrc       .vimrc

mkdir -p .config/fish
ln -sf dotfiles/config/fish .config/fish

command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew..."; \
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }

read -r -p "Install dependencies? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  brew install ctags git git-lfs node redis ripgrep ruby tig tmux vim
else
  exit 0
fi

echo "Done!"
