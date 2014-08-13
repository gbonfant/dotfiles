#!/usr/bin/env bash

set -e

DOTFILES_DIR=$(pwd)

create_symlinks() {
  for file in *; do
    if ! (echo $file | grep -q "script\|com\|text_\|README"); then
      ln -sf $(pwd)/$file $HOME/.$file
    fi
  done
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

echo "  > Installing rbenv..."
if command -v rbenv >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install rbenv --HEAD
fi

echo "  > Installing ruby-build..."
if command -v ruby-build >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install ruby-build
fi

echo "  > Installing the_silver_searcher..."
if command -v ag >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install the_silver_searcher
fi

echo "  > Installing tree..."
if command -v tree >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install tree
fi

echo "  > Installing fish..."
if command -v fish >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install fish

  echo "  > Setting fish as default shell..."
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi

echo "  > Installing macvim..."
if command -v mvim >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install macvim --with-cscope --with-lua --HEAD
fi

echo "  > Installing node..."
if command -v node >/dev/null 2>&1; then
  echo "  > Skipping, already installed"
else
  brew install node
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