#!/usr/bin/env bash

set -e

DOTFILES_DIR=$(pwd)
BREW_DEPENDENCIES=(rbenv ruby-build ag tree tig node)

create_symlinks() {
  for file in *; do
    if ! (echo $file | grep -q "script\|com\|text_\|README"); then
      ln -sf $(pwd)/$file $HOME/.$file
    fi
  done
}

install_dependencies_with_homebrew() {
  for dependency in ${BREW_DEPENDENCIES[@]}; do
    if ! hash $dependency 2>/dev/null; then
      echo "  > Installing" $dependency "..."

      brew install $dependency
    fi
  done
}

install_fish() {
  if ! hash fish 2>/dev/null; then
    echo "  > Installing fish..."
    brew install fish

    echo "  > Setting fish as default shell..."
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish
  fi
}

echo "      _       _    __ _ _            "
echo "     | |     | |  / _(_) |           "
echo "   __| | ___ | |_| |_ _| | ___  ___  "
echo "  / _\` |/ _ \| __|  _| | |/ _ \/ __| "
echo " | (_| | (_) | |_| | | | |  __/\__ \ "
echo "  \__,_|\___/ \__|_| |_|_|\___||___/ "
echo "                                     "
echo "                                     "


cd $DOTFILES_DIR
echo "==> Installing..."

# ===================================
# Homebrew installs
# ===================================

echo "  > Updating homebrew..."
brew update &> /dev/null

install_dependencies_with_homebrew
install_fish


echo "  > Installing macvim..."
if command -v mvim >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install macvim --with-cscope --with-lua --HEAD
fi

echo "  > Installing jshint..."
if command -v jshint >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  npm install -g jshint
fi

echo "  > Pulling latest changes..."
git pull &> /dev/null

echo "  > Creating symlinks..."
create_symlinks

echo "==> Done."
